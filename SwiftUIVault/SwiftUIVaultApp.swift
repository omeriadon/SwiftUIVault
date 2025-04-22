    //
    //  SwiftUIVaultApp.swift
    //  SwiftUIVault
    //
    //  Created by Adon Omeri on 21/4/2025.
    //

import SwiftUI
@_spi(Advanced) import SwiftUIIntrospect
import SettingsAccess
import AppKit


@main
struct SwiftUIVaultApp: App {
    
    
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @State private var isDarkModeOn = false
    
    
    
    @StateObject var tabState = TabState()
    
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate // Add AppKit delegate
    
    
    @Environment(\.openSettingsLegacy) private var openSettingsLegacy
    
    @State private var selectedItem: Item? = nil
    
    
    
    
    var body: some Scene {
        
        WindowGroup {
            
            
            
            
            
            NavigationSplitView {
                
                Spacer()
                    .frame(height: 10)
                List(selection: $selectedItem) {
                    ForEach(allItems) { item in
                        
                        HStack {
                            Image(item.logo)
                                .resizable()
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 14))
                            Text(item.name)
                            
                        }
                        .tag(item)
                        .frame(height: 60)
                    }
                    Button {
                        
                        tabState.selectedTab = "Contribute"
                        
                        try? openSettingsLegacy()
                        
                    } label: {
                        HStack {
                            Image(systemName: "plus.app")
                                .resizable()
                                .scaledToFit()
                                .bold()
                                .clipShape(RoundedRectangle(cornerRadius: 14))
                                .foregroundStyle(.blue)
                            VStack(spacing: 0) {
                                Text("Suggest Another")
                                Text("Package")
                            }
                            
                        }
                        .frame(height: 60)
                        
                    }
                    
                    .buttonStyle(.plain)
                }
                
                .toolbar(removing: .sidebarToggle)
                .listStyle(.sidebar)
                .navigationSplitViewColumnWidth(min: 210, ideal: 230, max: 260)
                
            } detail: {
                
                
                ItemDetailView(ItemInput: selectedItem)
                
            }
            .environmentObject(tabState)
            .openSettingsAccess()
            .toolbarBackground(.ultraThinMaterial, for: .windowToolbar)
            .toolbarBackgroundVisibility(.visible, for: .windowToolbar)
            .navigationSplitViewColumnWidth(min: 650, ideal: 700, max: 2_000)
            .introspect(.navigationSplitView, on: .macOS(.v13, .v14, .v15)) { splitview in
                if let delegate = splitview.delegate as? NSSplitViewController {
                    delegate.splitViewItems.first?.canCollapse = false
                    delegate.splitViewItems.first?.canCollapseFromWindowResize = false
                }
            }
            
        }
        
        
        Settings {
            
            
            SettingsView()
                .toolbarBackground(.ultraThinMaterial, for: .windowToolbar) // Sets background for toolbar content
                .frame(minWidth: 300, maxWidth: 700, minHeight: 400, maxHeight: 600)
                .navigationTitle("Settings")
                .environmentObject(tabState)
                .background(
                    WindowAccessor { window in
                            // Make window float on top of others
                        window.level = .normal
                        window.collectionBehavior = [.canJoinAllSpaces, .stationary]
                        
                            // Make window appear with proper translucency
                        window.isOpaque = false
                        window.backgroundColor = NSColor.clear
                        
                        
                        
                        
                        window.title = "Settings"
                        
                        window.toolbarStyle = .preference
                        
                        
                        
                    }
                )
                .background(.ultraThinMaterial)
            
        }
        
        
    }
    
}

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
            // Set window background when app launches
        if let window = NSApplication.shared.windows.first {
            window.backgroundColor = .controlAccentColor
        }
        
        
    }
    
    func applicationDidBecomeActive(_ notification: Notification) {
            // Ensure background is set when app becomes active
        if let window = NSApplication.shared.windows.first {
            window.backgroundColor = NSColor.controlAccentColor
        }
    }
    
    func applicationWillUpdate(_ notification: Notification) {
        DispatchQueue.main.async {
            if let menu = NSApplication.shared.mainMenu {
                for title in ["File", "Window", "View", "Help"] {
                    if let item = menu.items.first(where: { $0.title == title }) {
                        menu.removeItem(item)
                        
                    }
                }
            }
        }
    }
    
    
}

struct WindowAccessor: NSViewRepresentable {
    var callback: (NSWindow) -> Void
    
    func makeNSView(context: Context) -> NSView {
        let view = NSView()
        DispatchQueue.main.async {
            if let window = view.window {
                self.callback(window)
            }
        }
        return view
    }
    
    func updateNSView(_ nsView: NSView, context: Context) {
        DispatchQueue.main.async {
            if let window = nsView.window {
                self.callback(window)
            }
        }
    }
}
