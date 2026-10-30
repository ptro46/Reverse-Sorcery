import Foundation

public struct Room: Codable {
    public let id: Int
    public let address: Int
    public let tiles: [Int]
    public let collision: [Int]
    public let name: String?
    public let entities: [Int]?
    public let objects: [Int]?
}
public struct World: Codable {
    public let palette: [[Int]]
    public let rooms: [Room]
    public let objectNames: [String: String]
    public static func load(_ url: URL) throws -> World {
        let world = try JSONDecoder().decode(World.self, from: Data(contentsOf: url))
        guard world.rooms.count == 41, world.rooms.enumerated().allSatisfy({ $0.offset == $0.element.id && $0.element.tiles.count == 720 && $0.element.collision.count == 720 }),
              world.rooms.prefix(40).allSatisfy({ $0.entities?.count == 48 && $0.objects?.count == 8 }) else {
            throw NSError(domain: "Sorcery", code: 1, userInfo: [NSLocalizedDescriptionKey: "Ressources du jeu invalides"])
        }
        return world
    }
}
public struct Sprite {
    public var x: Double
    public var y: Double
    public var frame: Int
    public var fade: Double = 1
    public init(x: Double, y: Double, frame: Int) { self.x=x; self.y=y; self.frame=frame }
}
public struct Controls {
    public var up=false, left=false, right=false
    public init(up: Bool=false, left: Bool=false, right: Bool=false) {
        self.up=up; self.left=left; self.right=right
    }
}
public struct Item {
    public var y: Int, x: Int, frame: Int
}
public struct Enemy {
    public var kind: Int, y: Int, x: Int, frame: Int, tick: Int = 0
}
public struct RoomState {
    public var metadata: [Int]
    public var objects: [Item]
    public var enemies: [Enemy]
}
public struct Bolt {
    public var x: Double, y: Double, dx: Double, dy: Double, lifetime: Int
}
public enum Sound: String { case pickup, doorOpen, doorClose, rescue, damage, magic, death }

/// A native fixed-step game. No original instructions execute at runtime.
public final class Game {
    public let world: World
    public private(set) var states: [RoomState] = []
    public private(set) var roomID = 0
    public private(set) var x = 64, y = 0
    public private(set) var health = 99
    public private(set) var heldItem = 0
    public private(set) var rescued: Set<Int> = []
    public private(set) var visited: Set<Int> = [0]
    public private(set) var score = 0
    public private(set) var ticks = 0
    public private(set) var won = false
    public private(set) var dead = false
    public private(set) var message = "Retrouvez les huit sorciers et rejoignez le sanctuaire."
    public private(set) var exploration = false
    public private(set) var bolts: [Bolt] = []
    public var onSound: ((Sound) -> Void)?
    private var cooldown = 0, damageClock = 0, contactClock = 0
    private var direction = 0
    public var room: Room { world.rooms[roomID] }
    public var state: RoomState { states[roomID] }
    public var playerFrame: Int {
        if dead { return 76 + min(3, ticks/4 % 4) }
        return (direction < 0 ? 28 : direction > 0 ? 36 : 32) + ticks/4 % 4
    }
    public var heldName: String { world.objectNames[String(heldItem)] ?? "OBJET \(heldItem)" }
    public var title: String { room.name ?? "SALLE \(roomID+1)" }
    public init(world: World) { self.world=world; restart() }
    public func restart() {
        states = world.rooms.prefix(40).map { room in
            let e=room.entities!, o=room.objects!
            let enemies = [2,10].compactMap { offset -> Enemy? in
                guard (1...3).contains(e[offset] & 15) else { return nil }
                return Enemy(kind: e[offset]&15, y:e[offset+1], x:e[offset+2], frame:e[offset+3])
            }
            return RoomState(metadata:e, objects: [0,4].map { Item(y:o[$0],x:o[$0+1],frame:o[$0+2]) }, enemies:enemies)
        }
        roomID=0; x=64; y=0; health=99; heldItem=0; rescued=[]; visited=[0];score=0
        ticks=0; won=false; dead=false; exploration=false;bolts=[];cooldown=0;damageClock=0;contactClock=0
        message="Retrouvez les huit sorciers et rejoignez le sanctuaire."
    }
    public func visit(_ id: Int) {
        guard (0..<40).contains(id) else { return }
        exploration=true;roomID=id;visited.insert(id);x=64;y=0;dead=false;won=false;health=99;bolts=[]
        for yy in stride(from: 16, through:112, by:8) {
            for xx in stride(from: 12, through:132, by:4) {
                if !solid(x:xx,y:yy) { x=xx;y=yy;return }
            }
        }
    }
    public func toggleExploration() { exploration.toggle();message=exploration ? "Exploration : dégâts désactivés. Tab : carte." : "Mode jeu. R : recommencer une partie normale." }
    private func tileFlag(x: Int,y: Int) -> Int {
        guard x>=0 && y>=0 && x<160 && y<144 else { return 128 }
        let e=state.metadata
        for (offset,pattern) in [(18,[255,255,255,255,255,255,255,255,255]),
                                 (22,[255,255,255,255,255,255,255,255,255]),
                                 (26,[255,255,255,0,0,0,255,255,255]),
                                 (30,[255,255,255,0,0,0,255,255,255]),
                                 // Original 1d33 mask: the bowl's first eight
                                 // scanlines are empty, its lower sixteen solid.
                                 // This lands the 24px sorcerer at cauldronY-16,
                                 // the contact height used by the energy routine.
                                 (34,[0,0,0,255,255,255,255,255,255]),
                                 (37,[0,0,0,255,255,255,255,255,255]),
                                 (40,[0,255,0,0,255,0,0,0,0]),
                                 (43,[255,255,255,255,255,255,255,255,255])] {
            guard e[offset] != 255 else { continue }
            let col=x/4-e[offset+1]/4, row=y/8-e[offset]/8
            if (0..<3).contains(col) && (0..<3).contains(row) { return pattern[row*3+col] }
        }
        return room.collision[y/8*40+x/4]
    }
    private func solid(x:Int,y:Int) -> Bool {
        guard x>=0 && x<=148 && y>=0 && y<=120 else { return true }
        // Ignore the two-pixel margin of the original twelve-pixel XOR sprite.
        for yy in stride(from:y, through:y+23, by:4) {
            for xx in stride(from:x+1, through:x+10, by:3) {
                if tileFlag(x:xx,y:yy)&128 != 0 { return true }
            }
        }
        return false
    }
    // Port of collision probes at 1177, 118e, 11b4 and 11cb. Movement
    // between tile boundaries is free; only the newly exposed edge is tested.
    private func canMove(x:Int,y:Int,dx:Int=0,dy:Int=0) -> Bool {
        if x+dx<0 || x+dx>148 || y+dy<0 || y+dy>120 { return false }
        if dx != 0 {
            if x%4 != 0 { return true }
            let col=x/4+(dx<0 ? -1 : 3)
            for r in 0..<(y%8==0 ? 3 : 4) {
                if tileFlag(x:col*4,y:(y/8+r)*8)&128 != 0 { return false }
            }
        } else if dy != 0 {
            if y%8 != 0 { return true }
            let row=y/8+(dy<0 ? -1 : 3)
            for c in 0..<(x%4==0 ? 3 : 4) {
                if tileFlag(x:(x/4+c)*4,y:row*8)&128 != 0 { return false }
            }
        }
        return true
    }
    private func nearby(_ yy:Int,_ xx:Int, vertical:Int=18,horizontal:Int=9) -> Bool {
        yy != 255 && abs(y-yy)<=vertical && abs(x-xx)<=horizontal
    }
    private func damage(_ amount:Int) {
        guard !exploration && !dead else { return }
        health=max(0,health-amount)
        if contactClock==0 { onSound?(.damage);contactClock=12 }
        if health==0 { dead=true;message="Le sort est rompu. R pour recommencer.";onSound?(.death) }
    }
    public func step(_ controls:Controls) {
        guard !won && !dead else { ticks+=1;return }
        ticks+=1;cooldown=max(0,cooldown-1);contactClock=max(0,contactClock-1)
        direction = controls.left ? -1 : controls.right ? 1 : 0
        // Original rule: holding up rises, releasing it descends, with no inertia.
        let dy=controls.up ? -2 : 2
        if canMove(x:x,y:y,dy:dy) { y+=dy }
        let dx=direction*2
        if dx != 0 {
            if canMove(x:x,y:y,dx:dx) { x+=dx }
            else if cooldown==0 { tryDoor(direction) }
        }
        updateEnemies()
        updateBolts()
        for offset in [40,43] {
            let barrier=state.metadata
            if barrier[offset] != 255 && heldItem != 0 && heldItem==barrier[offset+2] && nearby(barrier[offset],barrier[offset+1],vertical:16,horizontal:8) {
                heldItem=0;states[roomID].metadata[offset]=255;score+=200
                message="Le passage est libéré.";onSound?(.magic)
            }
        }
        let e=state.metadata
        if nearby(e[34]-16,e[35],vertical:2,horizontal:4) && e[34] != 255 {
            health=min(99,health+1)
        }
        if nearby(e[37]-16,e[38],vertical:2,horizontal:4) && e[37] != 255 { damage(max(1,e[39])) }
        if e[46] != 255 && e[40]==255 && e[43]==255 && nearby(e[46],e[47],vertical:23,horizontal:11) {
            rescued.insert(roomID);states[roomID].metadata[46]=255;score+=2000
            message="Sorcier libéré : \(rescued.count)/8."
            onSound?(.rescue)
        }
        // The original game wins in room 28, at the sanctuary's upper opening.
        if rescued.count==8 && roomID==28 && abs(y-24)<=4 && abs(x-72)<=6 {
            won=true;message="Les huit sorciers sont réunis au sanctuaire !";onSound?(.rescue)
        }
        damageClock+=1
        if damageClock>=38 { damageClock=0;damage(1) }
        let feet=tileFlag(x:x+6,y:y+24)
        if feet==129 && !controls.up { damage(3) }
        if feet==2 { damage(1) }
    }
    private func tryDoor(_ direction:Int) {
        let e=state.metadata
        let offsets=direction<0 ? [18,22] : [26,30]
        for offset in offsets {
            guard e[offset] != 255, abs(y-e[offset])<=4,
                  abs(x-(e[offset+1]+(direction<0 ? 12 : -12)))<=4 else { continue }
            let requirement=e[offset+3]
            if requirement != 0 && !exploration && heldItem != (requirement==1 ? 59 : 43) {
                message=requirement==1 ? "Il vous faut les armoiries." : "Il vous faut la fleur de lys."
                cooldown=12;return
            }
            let destination=e[offset+2], next=destination&63
            guard next<40 else { return }
            roomID=next;visited.insert(next);bolts=[];score+=10
            let arrival = (destination&128 == 0 ? 18 : 26) + (destination&64 == 0 ? 0 : 4)
            let target=state.metadata
            y=target[arrival];x=target[arrival+1]+(destination&128 == 0 ? 12 : -12)
            x=max(0,min(148,x));y=max(0,min(120,y));cooldown=15
            message=title;onSound?(.doorOpen);return
        }
    }
    public func action() {
        guard !dead && !won else { return }
        for i in states[roomID].objects.indices {
            let item=states[roomID].objects[i]
            if item.frame != 0 && nearby(item.y,item.x) {
                states[roomID].objects[i].frame=heldItem
                heldItem=item.frame;score+=50
                message="Vous portez : \(heldName).";onSound?(.pickup);return
            }
        }
        let e=state.metadata
        for offset in [40,43] {
            if e[offset] != 255 && nearby(e[offset],e[offset+1],vertical:24,horizontal:16) {
                if heldItem==e[offset+2] || exploration {
                    heldItem=0;states[roomID].metadata[offset]=255;score+=200
                    message="Le passage est libéré.";onSound?(.magic)
                } else { message="Il faut un autre objet pour libérer ce passage." }
                return
            }
        }
        for i in states[roomID].enemies.indices {
            let enemy=states[roomID].enemies[i]
            let weapon=enemy.kind==1 ? 45 : enemy.kind==2 ? 65 : 44
            if heldItem==weapon && nearby(enemy.y,enemy.x) {
                states[roomID].enemies[i].kind=0;heldItem=0;score+=500;onSound?(.magic);return
            }
        }
        if heldItem==55 || heldItem==70 {
            let dirs:[(Double,Double)] = heldItem==55 ? [(-4,0),(-4,-2),(0,-2),(4,-2),(4,0),(4,2),(0,2),(-4,2)] : [(-4,0),(0,-2),(4,0),(0,2)]
            for (dx,dy) in dirs { bolts.append(Bolt(x:Double(x+4),y:Double(y+9),dx:dx,dy:dy,lifetime:70)) }
            heldItem=0;onSound?(.magic);return
        }
        message=heldItem==0 ? "Approchez-vous d’un objet, puis appuyez sur Espace." : "Vous portez : \(heldName)."
    }
    private func updateBolts() {
        for i in bolts.indices {
            bolts[i].x+=bolts[i].dx;bolts[i].y+=bolts[i].dy;bolts[i].lifetime-=1
            for j in states[roomID].enemies.indices {
                let enemy=states[roomID].enemies[j]
                if enemy.kind>0 && abs(bolts[i].x-Double(enemy.x+6))<10 && abs(bolts[i].y-Double(enemy.y+12))<20 {
                    states[roomID].enemies[j].kind=0;bolts[i].lifetime=0;score+=500;onSound?(.magic)
                }
            }
        }
        bolts.removeAll { $0.lifetime<=0 || $0.x<0 || $0.x>=160 || $0.y<0 || $0.y>=144 }
    }
    private func updateEnemies() {
        for i in states[roomID].enemies.indices {
            var enemy=states[roomID].enemies[i]
            guard enemy.kind>0 else { continue }
            enemy.tick+=1
            let dx=enemy.x==x ? 0 : enemy.x<x ? 1 : -1
            let dy=enemy.y==y ? 0 : enemy.y<y ? 1 : -1
            switch enemy.kind {
            case 1:
                if canMove(x:enemy.x,y:enemy.y,dx:dx) { enemy.x+=dx }
                if canMove(x:enemy.x,y:enemy.y,dy:dy) { enemy.y+=dy }
                enemy.frame=enemy.tick/4%4
            case 2:
                if canMove(x:enemy.x,y:enemy.y,dx:dx) { enemy.x+=dx }
                enemy.frame=(dx<0 ? 16 : 24)+enemy.tick/4%4
            default:
                enemy.x=max(0,min(148,enemy.x+dx*2));enemy.y=max(0,min(120,enemy.y+dy))
                enemy.frame=(dx<0 ? 4 : 12)+enemy.tick/4%4
            }
            states[roomID].enemies[i]=enemy
            if nearby(enemy.y,enemy.x) && ticks%4==0 { damage(enemy.kind==1 ? 2 : 1) }
        }
    }
    public func sprites() -> [Sprite] {
        var result=[Sprite]();let e=state.metadata
        for item in state.objects where item.frame>0 { result.append(Sprite(x:Double(item.x),y:Double(item.y),frame:item.frame)) }
        for (offset,frame) in [(18,49),(22,49),(26,53),(30,53),(34,54),(37,54),(40,67),(43,66)] where e[offset] != 255 {
            result.append(Sprite(x:Double(e[offset+1]),y:Double(e[offset]),frame:frame))
        }
        if e[46] != 255 {
            result.append(Sprite(x:Double(e[47]),y:Double(e[46]),frame:84+ticks/4%4))
        }
        for enemy in state.enemies where enemy.kind>0 { result.append(Sprite(x:Double(enemy.x),y:Double(enemy.y),frame:enemy.frame)) }
        if roomID==28 {
            let locations=[(4,104),(140,104),(20,88),(124,88),(36,72),(108,72),(52,48),(92,48)]
            for i in 0..<rescued.count { result.append(Sprite(x:Double(locations[i].0),y:Double(locations[i].1),frame:84+ticks/4%4)) }
        }
        result.append(Sprite(x:Double(x),y:Double(y),frame:playerFrame))
        return result
    }
}
