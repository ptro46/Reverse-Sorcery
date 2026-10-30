import AppKit
import AVFoundation
import SorceryCore

final class Audio {
    var muted=false { didSet { if muted { music?.pause();effects.values.forEach { $0.stop() } } } }
    private var effects:[String:AVAudioPlayer]=[:]
    private var music:AVAudioPlayer?
    init(root:URL) {
        for sound in ["title-music","pickup","doorOpen","doorClose","rescue","damage","magic","death"] {
            do {
                let player=try AVAudioPlayer(contentsOf:root.appendingPathComponent(sound+".wav"))
                player.volume=sound=="title-music" ? 0.38 : 0.5
                player.prepareToPlay()
                if sound=="title-music" { music=player;player.numberOfLoops = -1 }
                else { effects[sound]=player }
            } catch { NSLog("Audio %@ : %@",sound,error.localizedDescription) }
        }
    }
    func title(_ enabled:Bool) { if enabled && !muted { music?.play() } else { music?.stop();music?.currentTime=0 } }
    func play(_ sound:Sound) { guard !muted,let p=effects[sound.rawValue] else { return };p.currentTime=0;p.play() }
}

