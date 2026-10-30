import XCTest
@testable import SorceryCore

final class CauldronTests:XCTestCase {
    /// Isolate landing and energy from enemies and scenery. Keep the original
    /// 12×24 sprite, fixed steps, health decay and cauldron metadata/movement.
    private func world(y:Int=80,x:Int=64,harmful:Bool=false,present:Bool=true)->World {
        let rooms=(0..<41).map { id -> Room in
            var e=[Int](repeating:0,count:48)
            for offset in [18,22,26,30,34,37,40,43,46] { e[offset]=255 }
            if present && id==0 {
                let offset=harmful ? 37 : 34
                e[offset]=y;e[offset+1]=x;e[offset+2]=harmful ? 2 : 0
            }
            return Room(id:id,address:0,tiles:[Int](repeating:0,count:720),collision:[Int](repeating:0,count:720),name:"Test",entities:e,objects:[Int](repeating:0,count:8))
        }
        return World(palette:[],rooms:rooms,objectNames:[:])
    }
    private func approach(_ game:Game,x:Int) {
        // Start with genuinely depleted energy, using normal simulation.
        for _ in 0..<190 { game.step(Controls(up:true)) }
        while game.x != x { game.step(Controls(up:true,left:game.x>x,right:game.x<x)) }
    }
    func testLandingReachesRechargeSurfaceAndFillsEnergy() {
        let g=Game(world:world());approach(g,x:64)
        let depleted=g.health
        XCTAssertLessThan(depleted,99)
        for _ in 0..<40 { g.step(Controls()) }
        XCTAssertEqual(g.y,64,"Feet must settle eight pixels below the cauldron sprite's top")
        XCTAssertGreaterThan(g.health,depleted,"Resting on the cauldron must recharge energy")
        for _ in 0..<200 { g.step(Controls()) }
        XCTAssertEqual(g.y,64);XCTAssertEqual(g.health,99)
    }
    func testLandingAndRechargeAtEveryOriginalCauldronPosition() {
        let locations=[(112,48),(112,8),(72,52),(80,148),(56,48),(112,80),(64,120),(112,72),(112,88)]
        for (y,x) in locations {
            let g=Game(world:world(y:y,x:x));approach(g,x:x)
            let depleted=g.health
            for _ in 0..<80 { g.step(Controls()) }
            XCTAssertEqual(g.y,y-16,"Cauldron at \(x),\(y)")
            XCTAssertGreaterThan(g.health,depleted,"Cauldron at \(x),\(y)")
            XCTAssertEqual(g.health,99)
        }
    }
    func testOffCentreDoesNotRecharge() {
        let g=Game(world:world());approach(g,x:70)
        let depleted=g.health
        for _ in 0..<80 { g.step(Controls()) }
        XCTAssertEqual(g.y,64)
        XCTAssertLessThanOrEqual(g.health,depleted,"Recharge requires centring over the bowl")
    }
    func testMissingCauldronAndHarmfulCauldronDoNotHeal() {
        let empty=Game(world:world(present:false));approach(empty,x:64)
        let original=empty.health
        for _ in 0..<40 { empty.step(Controls()) }
        XCTAssertLessThanOrEqual(empty.health,original)
        let harmful=Game(world:world(harmful:true));approach(harmful,x:64)
        let before=harmful.health
        for _ in 0..<40 { harmful.step(Controls()) }
        XCTAssertEqual(harmful.y,64)
        XCTAssertLessThan(harmful.health,before)
    }
}
