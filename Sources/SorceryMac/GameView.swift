import AppKit
import GameController
import SorceryCore

final class GameView:NSView {
    override var isFlipped:Bool { true }
    override var acceptsFirstResponder:Bool { true }
    let game:Game
    let audio:Audio
    private let backgrounds:[NSImage],hdBackgrounds:[NSImage]
    private var frames:[NSImage]=[],hdFrames:[NSImage]=[]
    private var keys=Set<UInt16>(),letters=Set<String>()
    private var timer:Timer?
    private let step=1/37.5
    private var last=ProcessInfo.processInfo.systemUptime,accumulator=0.0
    private var previousSprites:[Sprite]=[],previousRoom=0
    private var lastPadAction=false,lastPadMenu=false,lastPadMap=false,lastPadConfirm=false
    var welcome=true,paused=false,map=false
    var highDefinition=true { didSet { needsDisplay=true } }
    private var mapSelection=0
    private var scale:CGFloat=1,origin=NSPoint.zero
    private var selectedPad:GCController?
    private var lastPadHorizontal=0,lastPadVertical=0
    private let sceneRect=NSRect(x:24,y:82,width:912,height:410.4)
    private let gold=NSColor(calibratedRed:1,green:0.80,blue:0.40,alpha:1)
    private let ink=NSColor(calibratedRed:0.035,green:0.043,blue:0.075,alpha:1)
    private let panel=NSColor(calibratedRed:0.075,green:0.085,blue:0.14,alpha:1)
    private let secondary=NSColor(calibratedRed:0.64,green:0.69,blue:0.80,alpha:1)
    init(root:URL,world:World) throws {
        game=Game(world:world);audio=Audio(root:root)
        func images(_ folder:URL) throws->[NSImage] {
            try (0..<41).map { i in
                let url=folder.appendingPathComponent(String(format:"room-%02d.png",i))
                guard let image=NSImage(contentsOf:url) else { throw NSError(domain:"Sorcery",code:2,userInfo:[NSLocalizedDescriptionKey:"Décor manquant : \(url.lastPathComponent)"]) }
                return image
            }
        }
        func sprites(_ url:URL,cellWidth:Int,cellHeight:Int) throws->[NSImage] {
            guard let atlas=NSImage(contentsOf:url),let cg=atlas.cgImage(forProposedRect:nil,context:nil,hints:nil),cg.width==cellWidth*16,cg.height==cellHeight*6 else {
                throw NSError(domain:"Sorcery",code:3,userInfo:[NSLocalizedDescriptionKey:"Atlas de sprites invalide"])
            }
            return try (0..<96).map { i in
                guard let crop=cg.cropping(to:CGRect(x:i%16*cellWidth,y:i/16*cellHeight,width:cellWidth,height:cellHeight)) else { throw NSError(domain:"Sorcery",code:4) }
                return NSImage(cgImage:crop,size:NSSize(width:24,height:24))
            }
        }
        backgrounds=try images(root)
        hdBackgrounds=try images(root.appendingPathComponent("HD"))
        frames=try sprites(root.appendingPathComponent("sprites.png"),cellWidth:12,cellHeight:24)
        hdFrames=try sprites(root.appendingPathComponent("HD/sprites.png"),cellWidth:192,cellHeight:192)
        super.init(frame:NSRect(x:0,y:0,width:1152,height:864))
        previousSprites=game.sprites()
        game.onSound={ [weak self] sound in self?.audio.play(sound) }
        timer=Timer(timeInterval:1/60,repeats:true) { [weak self] _ in self?.tick() }
        RunLoop.main.add(timer!,forMode:.common)
        NotificationCenter.default.addObserver(self,selector:#selector(lostFocus),name:NSWindow.didResignKeyNotification,object:nil)
        audio.title(true)
        setAccessibilityElement(true);setAccessibilityRole(.group)
        setAccessibilityLabel("Sorcery HD. Entrée pour jouer. Flèches pour voler et se déplacer, Espace pour agir. H : rendu HD ou rétro. F : plein écran.")
    }
    required init?(coder:NSCoder) { fatalError("init(coder:) is not supported") }
    @objc private func lostFocus() { keys=[];letters=[];if !welcome { paused=true };needsDisplay=true }
    @objc func toggleHD(_ sender:Any?) { highDefinition.toggle() }
    @objc func toggleFullscreen(_ sender:Any?) { window?.toggleFullScreen(sender) }
    @objc func toggleMute(_ sender:Any?) { audio.muted.toggle();if welcome { audio.title(true) };needsDisplay=true }
    @objc func newGame(_ sender:Any?) {
        game.restart();welcome=false;paused=false;map=false;audio.title(false);resetInterpolation()
    }
    private func resetInterpolation() {
        previousSprites=game.sprites();previousRoom=game.roomID;accumulator=0
    }
    private func confirm() {
        if map { game.visit(mapSelection);map=false;paused=false;resetInterpolation() }
        else if welcome { welcome=false;audio.title(false);resetInterpolation() }
        else if game.dead || game.won { newGame(nil) }
        else { paused=false }
    }
    private func toggleMap() {
        guard !welcome else { return }
        map.toggle();mapSelection=game.roomID;keys=[];letters=[]
    }
    private func pause() {
        if map { map=false } else if !welcome { paused.toggle();keys=[];letters=[] }
    }
    private func tick() {
        let now=ProcessInfo.processInfo.systemUptime,elapsed=min(0.1,now-last);last=now
        var padUp=false,padLeft=false,padRight=false
        if NSApp.isActive {
            // Re-fetch the live profile, including controllers connected after launch.
            selectedPad=GCController.controllers().first { $0.extendedGamepad != nil }
            if let pad=selectedPad?.extendedGamepad {
                let confirmPressed=pad.buttonA.isPressed,actionPressed=pad.buttonB.isPressed
                let menuPressed=pad.buttonMenu.isPressed,mapPressed=pad.buttonX.isPressed
                if confirmPressed && !lastPadConfirm && (welcome || paused || map || game.dead || game.won) { confirm() }
                if actionPressed && !lastPadAction && !welcome && !paused && !map { game.action() }
                if menuPressed && !lastPadMenu { pause() }
                if mapPressed && !lastPadMap { toggleMap() }
                lastPadConfirm=confirmPressed;lastPadAction=actionPressed;lastPadMenu=menuPressed;lastPadMap=mapPressed
                let horizontal=abs(pad.dpad.xAxis.value)>0.25 ? pad.dpad.xAxis.value : pad.leftThumbstick.xAxis.value
                let vertical=abs(pad.dpad.yAxis.value)>0.25 ? pad.dpad.yAxis.value : pad.leftThumbstick.yAxis.value
                let h=horizontal < -0.25 ? -1 : horizontal > 0.25 ? 1 : 0
                let v=vertical < -0.25 ? -1 : vertical > 0.25 ? 1 : 0
                if map {
                    if h != 0 && h != lastPadHorizontal { mapSelection=max(0,min(39,mapSelection+h)) }
                    if v != 0 && v != lastPadVertical { mapSelection=max(0,min(39,mapSelection-v*8)) }
                }
                lastPadHorizontal=h;lastPadVertical=v
                padLeft=horizontal < -0.25;padRight=horizontal > 0.25
                padUp=pad.dpad.up.isPressed || pad.leftThumbstick.yAxis.value>0.25 || confirmPressed
            } else { lastPadAction=false;lastPadMenu=false;lastPadMap=false;lastPadConfirm=false;lastPadHorizontal=0;lastPadVertical=0 }
        }
        if !welcome && !paused && !map && NSApp.isActive {
            accumulator+=elapsed
            while accumulator>=step {
                previousSprites=game.sprites();previousRoom=game.roomID
                game.step(Controls(up:keys.contains(126)||letters.contains("w")||letters.contains("z")||padUp,
                                   left:keys.contains(123)||letters.contains("a")||letters.contains("q")||padLeft,
                                   right:keys.contains(124)||letters.contains("d")||padRight))
                accumulator-=step
            }
        } else { accumulator=0 }
        needsDisplay=true
    }
    override func keyDown(with event:NSEvent) {
        guard !event.modifierFlags.contains(.command) else { super.keyDown(with:event);return }
        let code=event.keyCode,letter=event.charactersIgnoringModifiers?.lowercased() ?? ""
        if event.isARepeat { return }
        if letter=="h" { toggleHD(nil);return }
        if letter=="f" { toggleFullscreen(nil);return }
        if letter=="m" { toggleMute(nil);return }
        if map {
            if code==123 { mapSelection=max(0,mapSelection-1) }
            else if code==124 { mapSelection=min(39,mapSelection+1) }
            else if code==126 { mapSelection=max(0,mapSelection-8) }
            else if code==125 { mapSelection=min(39,mapSelection+8) }
            else if code==36 || code==76 { confirm() }
            else if code==48 || code==53 { map=false }
            else if letter=="r" { newGame(nil) }
            needsDisplay=true;return
        }
        keys.insert(code);letters.insert(letter)
        if code==36 || code==76 { confirm() }
        else if (code==49 || letter=="e") && !welcome && !paused { game.action() }
        else if letter=="r" { newGame(nil) }
        else if code==53 || letter=="p" { pause() }
        else if code==48 { toggleMap() }
        else if code==120 { game.toggleExploration() }
        else if game.exploration && (letter=="[" || letter=="]") {
            game.visit((game.roomID+(letter=="[" ? 39 : 1))%40);resetInterpolation()
        }
        needsDisplay=true
    }
    override func keyUp(with event:NSEvent) {
        keys.remove(event.keyCode);letters.remove(event.charactersIgnoringModifiers?.lowercased() ?? "")
    }
    override func mouseDown(with event:NSEvent) {
        window?.makeFirstResponder(self)
        let p=convert(event.locationInWindow,from:nil)
        let q=NSPoint(x:(p.x-origin.x)/scale,y:(p.y-origin.y)/scale)
        if welcome {
            if NSRect(x:300,y:446,width:360,height:54).contains(q) { confirm() }
        } else if map {
            for i in 0..<40 where mapCell(i).contains(q) { mapSelection=i;confirm();break }
        } else if paused || game.dead || game.won {
            if NSRect(x:300,y:330,width:360,height:50).contains(q) { confirm() }
            else if NSRect(x:300,y:392,width:360,height:42).contains(q) { newGame(nil) }
        }
        if NSRect(x:716,y:24,width:104,height:36).contains(q) { toggleHD(nil) }
        else if NSRect(x:832,y:24,width:104,height:36).contains(q) { toggleFullscreen(nil) }
        needsDisplay=true
    }
    private func text(_ value:String,in rect:NSRect,size:CGFloat=16,color:NSColor = .white,weight:NSFont.Weight = .regular,align:NSTextAlignment = .left) {
        let p=NSMutableParagraphStyle();p.lineBreakMode = .byTruncatingTail;p.alignment=align
        (value as NSString).draw(in:rect,withAttributes:[.font:NSFont.systemFont(ofSize:size,weight:weight),.foregroundColor:color,.paragraphStyle:p])
    }
    private func label(_ value:String,_ x:CGFloat,_ y:CGFloat,_ w:CGFloat,size:CGFloat=16,color:NSColor = .white,weight:NSFont.Weight = .regular) {
        text(value,in:NSRect(x:x,y:y,width:w,height:32),size:size,color:color,weight:weight)
    }
    private func fill(_ rect:NSRect,_ color:NSColor,radius:CGFloat=0) {
        color.setFill();NSBezierPath(roundedRect:rect,xRadius:radius,yRadius:radius).fill()
    }
    private func button(_ title:String,_ rect:NSRect,primary:Bool=false) {
        fill(rect,primary ? gold : panel,radius:10)
        text(title,in:NSRect(x:rect.minX+6,y:rect.minY+(rect.height-22)/2,width:rect.width-12,height:26),size:16,color:primary ? ink : .white,weight:.semibold,align:.center)
    }
    private var interpolation:NSImageInterpolation { highDefinition ? .high : .none }
    private func image(_ image:NSImage,in rect:NSRect) {
        image.draw(in:rect,from:.zero,operation:.sourceOver,fraction:1,respectFlipped:true,hints:[.interpolation:interpolation])
    }
    private func sprite(_ frame:Int,in rect:NSRect) {
        let atlas=highDefinition ? hdFrames : frames
        if atlas.indices.contains(frame) { image(atlas[frame],in:rect) }
    }
    override func draw(_ dirtyRect:NSRect) {
        ink.setFill();bounds.fill()
        guard let context=NSGraphicsContext.current else { return }
        context.saveGraphicsState();context.shouldAntialias=true
        scale=min(bounds.width/960,bounds.height/720)
        origin=NSPoint(x:(bounds.width-960*scale)/2,y:(bounds.height-720*scale)/2)
        let t=NSAffineTransform();t.translateX(by:origin.x,yBy:origin.y);t.scale(by:scale);t.concat()
        fill(NSRect(x:0,y:0,width:960,height:720),ink)
        drawHeader()
        context.saveGraphicsState()
        NSBezierPath(roundedRect:sceneRect,xRadius:12,yRadius:12).addClip()
        image((highDefinition ? hdBackgrounds : backgrounds)[game.roomID],in:sceneRect)
        let poses=interpolatedSprites(previous:previousSprites,current:game.sprites(),alpha:(!paused && !map && !welcome && highDefinition) ? accumulator/step : 1,sameRoom:previousRoom==game.roomID)
        let sx=sceneRect.width/160,sy=sceneRect.height/144
        for s in poses {
            sprite(s.frame,in:NSRect(x:sceneRect.minX+s.x*sx,y:sceneRect.minY+s.y*sy,width:12*sx,height:24*sy))
        }
        for b in game.bolts {
            fill(NSRect(x:sceneRect.minX+b.x*sx,y:sceneRect.minY+b.y*sy,width:3*sx,height:2*sy),gold,radius:3)
        }
        context.restoreGraphicsState()
        drawHUD()
        if welcome { drawWelcome() }
        else if map { drawMap() }
        else if paused || game.dead || game.won { drawPause() }
        context.restoreGraphicsState()
    }
    private func drawHeader() {
        label("✦",24,22,40,size:30,color:gold)
        label("SORCERY",62,20,160,size:26,color:.white,weight:.bold)
        label(highDefinition ? "HD" : "RÉTRO",226,29,65,size:13,color:gold,weight:.bold)
        label(game.title,320,23,360,size:21,weight:.medium)
        label(String(format:"SALLE %02d / 40",game.roomID+1),320,49,300,size:11,color:secondary)
        button(highDefinition ? "HD  ·  H" : "Rétro  ·  H",NSRect(x:716,y:24,width:104,height:36))
        button("Écran  ·  F",NSRect(x:832,y:24,width:104,height:36))
    }
    private func drawHUD() {
        let top:CGFloat=510
        for r in [NSRect(x:24,y:top,width:240,height:92),NSRect(x:276,y:top,width:200,height:92),NSRect(x:488,y:top,width:448,height:92)] { fill(r,panel,radius:12) }
        label("ÉNERGIE",40,top+12,140,size:12,color:secondary,weight:.semibold)
        label("\(game.health)",194,top+10,54,size:26,color:game.health<25 ? .systemRed : .white,weight:.semibold)
        fill(NSRect(x:40,y:top+58,width:208,height:8),ink,radius:4)
        fill(NSRect(x:40,y:top+58,width:208*CGFloat(game.health)/99,height:8),game.health<25 ? .systemRed : NSColor(calibratedRed:0.38,green:0.85,blue:0.68,alpha:1),radius:4)
        label("SORCIERS LIBÉRÉS",292,top+12,176,size:12,color:secondary,weight:.semibold)
        label("\(game.rescued.count) / 8",292,top+34,170,size:30,color:gold,weight:.semibold)
        label("OBJET TRANSPORTÉ",504,top+12,300,size:12,color:secondary,weight:.semibold)
        label(game.heldItem==0 ? "Aucun objet" : game.heldName,504,top+38,340,size:20,weight:.medium)
        if game.heldItem>0 { sprite(game.heldItem,in:NSRect(x:868,y:top+23,width:48,height:48)) }
        label(game.message,28,620,900,size:16,color:gold)
        label("↑ / W / Z  Voler     ← → / A D / Q D  Diriger     Espace / E  Action",28,658,910,size:13,color:secondary)
        label("Tab  Carte     Échap / P  Pause     R  Recommencer     M  Son",28,681,700,size:13,color:secondary)
        let mode=game.exploration ? "EXPLORATION" : "SCORE  \(game.score)"
        text(mode,in:NSRect(x:714,y:681,width:218,height:22),size:12,color:game.exploration ? gold : secondary,weight:.semibold,align:.right)
    }
    private func dim() { fill(NSRect(x:0,y:76,width:960,height:644),ink.withAlphaComponent(0.91)) }
    private func drawWelcome() {
        dim();fill(NSRect(x:160,y:136,width:640,height:416),panel,radius:24)
        text("SORCERY",in:NSRect(x:180,y:170,width:600,height:90),size:64,color:gold,weight:.bold,align:.center)
        text("L’aventure Amstrad, sur votre Mac",in:NSRect(x:180,y:260,width:600,height:34),size:22,color:.white,weight:.medium,align:.center)
        text("40 salles à explorer. Huit sorciers à retrouver.",in:NSRect(x:180,y:324,width:600,height:30),size:18,color:secondary,align:.center)
        text("Trouvez les objets et ouvrez le chemin du sanctuaire.",in:NSRect(x:180,y:356,width:600,height:30),size:17,color:secondary,align:.center)
        text("Textures HD  ·  Affichage fluide  ·  Clavier ou manette",in:NSRect(x:180,y:402,width:600,height:26),size:14,color:gold,align:.center)
        button("Jouer   ↵",NSRect(x:300,y:446,width:360,height:54),primary:true)
        text("H pour comparer les graphismes HD et rétro",in:NSRect(x:180,y:516,width:600,height:24),size:13,color:secondary,align:.center)
    }
    private func drawPause() {
        dim();fill(NSRect(x:176,y:190,width:608,height:310),panel,radius:24)
        text(game.won ? "Les huit sorciers sont sauvés" : game.dead ? "Le sort est rompu" : "Pause",in:NSRect(x:196,y:226,width:568,height:55),size:34,color:gold,weight:.bold,align:.center)
        text("Prenez le temps de préparer votre prochain sort.",in:NSRect(x:196,y:284,width:568,height:30),size:17,color:secondary,align:.center)
        button(game.dead || game.won ? "Rejouer   ↵" : "Reprendre   ↵",NSRect(x:300,y:330,width:360,height:50),primary:true)
        button("Nouvelle partie   R",NSRect(x:300,y:392,width:360,height:42))
        text("Tab : explorer les salles   ·   F2 : mode sans dégâts",in:NSRect(x:196,y:454,width:568,height:24),size:14,color:secondary,align:.center)
    }
    private func mapCell(_ i:Int)->NSRect { NSRect(x:32+i%8*113,y:142+i/8*98,width:105,height:90) }
    private func drawMap() {
        fill(NSRect(x:0,y:76,width:960,height:644),ink)
        label("Les quarante salles",32,88,700,size:28,color:gold,weight:.bold)
        label("Flèches + Entrée, ou clic : visiter en mode exploration sans dégâts.",32,122,900,size:14,color:secondary)
        for i in 0..<40 {
            let cell=mapCell(i)
            fill(cell,i==mapSelection ? gold : panel,radius:8)
            image((highDefinition ? hdBackgrounds : backgrounds)[i],in:NSRect(x:cell.minX+3,y:cell.minY+3,width:99,height:45))
            label(String(format:"%02d",i+1)+(game.rescued.contains(i) ? "  ✦" : ""),cell.minX+7,cell.minY+53,90,size:15,color:i==mapSelection ? ink : .white,weight:.semibold)
            label(game.visited.contains(i) ? "VISITÉE" : "À DÉCOUVRIR",cell.minX+7,cell.minY+75,93,size:8,color:i==mapSelection ? ink : secondary)
        }
        label("Tab : revenir à la partie     R : nouvelle partie normale",32,660,900,size:15,color:secondary)
    }
}
