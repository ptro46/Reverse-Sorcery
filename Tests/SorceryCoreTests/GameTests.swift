import XCTest
@testable import SorceryCore

final class GameTests:XCTestCase {
    func load() throws -> World {
        let root=URL(fileURLWithPath:#filePath).deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent()
        return try World.load(root.appendingPathComponent("Sources/SorceryMac/Resources/world.json"))
    }
    func testExtractedWorldAndConnectivity() throws {
        let w=try load();XCTAssertEqual(w.rooms.count,41)
        var reached:Set<Int>=[0]
        for _ in 0..<40 {
            for id in Array(reached) {
                let e=w.rooms[id].entities!
                for offset in [18,22,26,30] where e[offset] != 255 {
                    XCTAssertLessThan(e[offset+2]&63,40)
                    reached.insert(e[offset+2]&63)
                }
            }
        }
        XCTAssertEqual(reached.count,40,"Every original room is reachable in the recovered graph")
        XCTAssertEqual(w.rooms.prefix(40).filter { $0.entities![46] != 255 }.count,8)
        XCTAssertEqual(w.objectNames["43"],"FLEUR DE LYS")
        XCTAssertEqual(w.objectNames["59"],"COAT OF ARMS")
    }
    func testNativeFlightAndOriginalDoor() throws {
        let g=Game(world:try load())
        for _ in 0..<26 { g.step(Controls(up:true,left:true)) }
        XCTAssertEqual(g.roomID,0);XCTAssertEqual(g.x,12);XCTAssertEqual(g.y,0)
        g.step(Controls(up:true,left:true))
        XCTAssertEqual(g.roomID,1);XCTAssertEqual(g.x,136);XCTAssertEqual(g.y,0)
        XCTAssertTrue(g.visited.contains(1))
        let falling=Game(world:try load())
        falling.step(Controls());XCTAssertEqual(falling.y,2,"Releasing up in free space should descend")
    }
    func testExplorationAndRestart() throws {
        let g=Game(world:try load());g.visit(28)
        XCTAssertTrue(g.exploration);XCTAssertEqual(g.roomID,28)
        for _ in 0..<500 { g.step(Controls()) }
        XCTAssertEqual(g.health,99);XCTAssertFalse(g.dead)
        g.restart();XCTAssertFalse(g.exploration);XCTAssertEqual(g.roomID,0)
        XCTAssertEqual(g.x,64);XCTAssertEqual(g.y,0);XCTAssertEqual(g.score,0)
    }
    func testAllRoomsStayWithinBounds() throws {
        let g=Game(world:try load())
        for id in 0..<40 {
            g.visit(id)
            for t in 0..<400 {
                g.step(Controls(up:t%100<50,left:t%160<80,right:t%160>=80))
                if t%31==0 { g.action() }
                XCTAssertTrue((0...148).contains(g.x));XCTAssertTrue((0...120).contains(g.y))
                XCTAssertTrue(g.sprites().allSatisfy { (0..<96).contains($0.frame) })
            }
        }
    }
}

final class PresentationTests:XCTestCase {
    func testSubFrameMovementWithoutChangingSimulation() {
        let old=[Sprite(x:10,y:20,frame:32)],new=[Sprite(x:12,y:22,frame:33)]
        let pose=interpolatedSprites(previous:old,current:new,alpha:0.5,sameRoom:true)[0]
        XCTAssertEqual(pose.x,11);XCTAssertEqual(pose.y,21);XCTAssertEqual(pose.frame,33)
        XCTAssertEqual(new[0].x,12)
    }
    func testRoomTransitionsAndRemovedSpritesSnap() {
        let old=[Sprite(x:10,y:20,frame:32)],new=[Sprite(x:12,y:22,frame:33)]
        XCTAssertEqual(interpolatedSprites(previous:old,current:new,alpha:0,sameRoom:false)[0].x,12)
        XCTAssertEqual(interpolatedSprites(previous:old,current:[],alpha:0.5,sameRoom:true).count,0)
        let teleport=[Sprite(x:100,y:100,frame:32)]
        XCTAssertEqual(interpolatedSprites(previous:old,current:teleport,alpha:0.5,sameRoom:true)[0].x,100)
    }
}
