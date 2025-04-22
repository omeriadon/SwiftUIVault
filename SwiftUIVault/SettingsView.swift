//
//  SettingsView.swift
//  SwiftUIVault
//
//  Created by Adon Omeri on 22/4/2025.
//

import SwiftUI



struct SettingsView: View {
    
    
    @EnvironmentObject var tabState: TabState
    
    @State var contributeTextField: String = ""
    
    @State var contactTextField: String = ""
    
    
    
    var body: some View {
        TabView(selection: $tabState.selectedTab) {
            
 
            
            Tab(value: "General") {
                
                Form {
//                    Text("Current Theme: \(selectedT2Aheme.rawValue.capitalized)")
                    
                        // Theme Picker
//                    Picker("Appearance", selection: $selectedTheme) {
//                        ForEach(AppColorScheme.allCases) { scheme in
//                            Text(scheme.rawValue.capitalized).tag(scheme)
//                        }
//                    }
//                    .pickerStyle(SegmentedPickerStyle())
                }
                .padding()
                
            } label: {
                Label("General", systemImage: "gear")
            }
            
            
            Tab(value: "Contribute") {
                
                Form {
                    Section {
                        
                        GroupBox(label:
                            Label("Subject", systemImage: "square.and.pencil")
                        ) {
 
                            TextEditor(text: $contributeTextField)
                                .textEditorStyle(.plain)
                                .padding(8)
                                .background(.ultraThinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                        .headerProminence(.increased)
                        
                        Button {
                            let service = NSSharingService(named: NSSharingService.Name.composeEmail)!
                            service.recipients = ["omeriadon@outlook.com"]
                            service.subject = "SwiftUI Package Addition Request"
                            service.perform(withItems: [contributeTextField])
                        } label: {
                            Label("Send Email", systemImage: "paperplane")
                        }

                    } header: {
                        Label("Request SwiftUI Package Addition", systemImage: "envelope")
                    }
                    .headerProminence(.increased)

                    
                }
                .formStyle(.grouped)
                .padding()
                
            } label: {
                Label("Contribute", systemImage: "person.2.badge.plus.fill")
            }
            
            Tab(value: "Contact") {
                
                Form {
                    Section {
                        
                        GroupBox(label:
                                    Label("Subject", systemImage: "square.and.pencil")
                        ) {
                            
                            TextEditor(text: $contactTextField)
                                .textEditorStyle(.plain)
                                .padding(8)
                                .background(.ultraThinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                        .headerProminence(.increased)
                        
                        Button {
                            let service = NSSharingService(named: NSSharingService.Name.composeEmail)!
                            service.recipients = ["omeriadon@outlook.com"]
                            service.subject = "Contact SwiftUIVault Maintainer"
                            service.perform(withItems: [contactTextField])
                        } label: {
                            Label("Send Email", systemImage: "paperplane")
                        }
                        
                    } header: {
                        Label("Contact SwiftUIVault Maintainer", systemImage: "envelope")
                    }
                    .headerProminence(.increased)
                    
                    
                }
                .formStyle(.grouped)
                .padding()
                
            } label: {
                Label("Contact", systemImage: "person.crop.circle")
            }
            
        }
        .tabViewStyle(.tabBarOnly)
    }
}

#Preview {
    SettingsView()
}




