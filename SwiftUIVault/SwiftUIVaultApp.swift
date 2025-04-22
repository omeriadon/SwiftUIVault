    //
    //  SwiftUIVaultApp.swift
    //  SwiftUIVault
    //
    //  Created by Adon Omeri on 21/4/2025.
    //

import SwiftUI
@_spi(Advanced) import SwiftUIIntrospect
import ColorfulX


@main
struct SwiftUIVaultApp: App {
    
    @State var colors: [Color] = ColorfulPreset.appleIntelligence.colors.map { Color($0) }
    
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
                }

                
                .toolbar(removing: .sidebarToggle)
                .listStyle(.sidebar)
                .navigationSplitViewColumnWidth(min: 195, ideal: 200, max: 230)
                
            } detail: {
                
                ItemDetailView(ItemInput: selectedItem)
                
            }

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
        
    }
}

