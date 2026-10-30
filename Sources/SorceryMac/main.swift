import AppKit
import SorceryCore

final class AppDelegate:NSObject,NSApplicationDelegate {
    var window:NSWindow?
    func applicationDidFinishLaunching(_ notification:Notification) {
        do {
            let bundled=Bundle.main.resourceURL!.appendingPathComponent("Game")
            let root=FileManager.default.fileExists(atPath:bundled.path) ? bundled : Bundle.module.resourceURL!.appendingPathComponent("Resources")
            let world=try World.load(root.appendingPathComponent("world.json"))
            let view=try GameView(root:root,world:world)
            let available=NSScreen.main?.visibleFrame.size ?? NSSize(width:1280,height:960)
            let size=NSSize(width:min(1152,available.width*0.92),height:min(864,available.height*0.9))
            let window=NSWindow(contentRect:NSRect(origin:.zero,size:size),styleMask:[.titled,.closable,.miniaturizable,.resizable],backing:.buffered,defer:false)
            window.title="Sorcery HD — 0.2.1";window.contentMinSize=NSSize(width:800,height:600)
            window.collectionBehavior = [.fullScreenPrimary]
            window.contentView=view;window.center();self.window=window
            let menu=NSMenu();let appItem=NSMenuItem();menu.addItem(appItem)
            let appMenu=NSMenu();appItem.submenu=appMenu
            appMenu.addItem(withTitle:"À propos de Sorcery HD",action:#selector(NSApplication.orderFrontStandardAboutPanel(_:)),keyEquivalent:"")
            appMenu.addItem(.separator());appMenu.addItem(withTitle:"Quitter Sorcery HD",action:#selector(NSApplication.terminate(_:)),keyEquivalent:"q")
            let gameItem=NSMenuItem(title:"Partie",action:nil,keyEquivalent:"");menu.addItem(gameItem)
            let gameMenu=NSMenu(title:"Partie");gameItem.submenu=gameMenu
            let restart=gameMenu.addItem(withTitle:"Nouvelle partie",action:#selector(GameView.newGame(_:)),keyEquivalent:"n");restart.target=view
            let mute=gameMenu.addItem(withTitle:"Activer / couper le son",action:#selector(GameView.toggleMute(_:)),keyEquivalent:"");mute.target=view
            let display=NSMenuItem(title:"Affichage",action:nil,keyEquivalent:"");menu.addItem(display)
            let displayMenu=NSMenu(title:"Affichage");display.submenu=displayMenu
            let hd=displayMenu.addItem(withTitle:"Basculer HD / rétro (H)",action:#selector(GameView.toggleHD(_:)),keyEquivalent:"");hd.target=view
            let fullscreen=displayMenu.addItem(withTitle:"Plein écran",action:#selector(GameView.toggleFullscreen(_:)),keyEquivalent:"f");fullscreen.target=view;fullscreen.keyEquivalentModifierMask=[.command,.control]
            NSApp.mainMenu=menu
            window.makeKeyAndOrderFront(nil);window.makeFirstResponder(view);NSApp.activate(ignoringOtherApps:true)
        } catch {
            let alert=NSAlert();alert.messageText="Impossible d’ouvrir Sorcery HD";alert.informativeText=error.localizedDescription;alert.runModal();NSApp.terminate(nil)
        }
    }
    func applicationShouldTerminateAfterLastWindowClosed(_ sender:NSApplication)->Bool { true }
}
let app=NSApplication.shared
let delegate=AppDelegate()
app.delegate=delegate
app.setActivationPolicy(.regular)
app.run()
