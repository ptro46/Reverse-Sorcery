import Foundation

/// Interpolate presentation only: gameplay, contacts and timing stay fixed.
/// Teleports, room changes and inserted/removed entities snap to the new state.
public func interpolatedSprites(previous:[Sprite],current:[Sprite],alpha:Double,sameRoom:Bool)->[Sprite] {
    guard sameRoom,previous.count==current.count else { return current }
    let t=max(0,min(1,alpha))
    return current.enumerated().map { index,sprite in
        let old=previous[index]
        guard abs(old.x-sprite.x)<=8,abs(old.y-sprite.y)<=8 else { return sprite }
        var blended=sprite
        blended.x=old.x+(sprite.x-old.x)*t
        blended.y=old.y+(sprite.y-old.y)*t
        return blended
    }
}
