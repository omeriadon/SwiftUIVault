    //
    //  ItemDetailView.swift
    //  SwiftUIVault
    //
    //  Created by Adon Omeri on 21/4/2025.
    //

import SwiftUI
import ColorfulX


struct ItemDetailView: View {
    
    @State var colors: [Color] = ColorfulPreset.aurora.colors.map { Color($0) }
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var ItemInput: Item?
    
    var body: some View {
        ZStack {
            
            ColorfulView(color: $colors)
                .opacity(0.5)
                .onAppear {
                    colors = ColorPreset.allCases.randomElement()?.colors.map { Color($0) } ?? [.blue, .red]
                }
                .onChange(of: ItemInput, {
                    colors = ColorPreset.allCases.randomElement()?.colors.map { Color($0) } ?? [.blue, .red]
                })
            

                
                
                
                if let item = ItemInput {
                    ScrollView {
                        GroupBox {
                            GroupBox {
                                HStack {
                                    Image(item.logo)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50)
                                        .clipShape(RoundedRectangle(cornerRadius: 12))
                                    
                                    Text(item.name)
                                        .font(.largeTitle)
                                        .bold()
                                    Spacer()
                                    Text(item.description)
                                        .lineLimit(3)
                                        
                                        
                                        
                                        
                                }
                                .padding()
                                .frame(height: 50)
                            }
                            .groupBoxStyle(UltraThinGroupBoxStyle())
                            
                            HStack {
                                GroupBox {
                                    Label(item.creator, systemImage: "person.circle")
                                }
                                .groupBoxStyle(UltraThinGroupBoxStyle())
                                Spacer()
                                GroupBox {
                                    Link(destination: item.link) {
                                        Label(item.link.absoluteString, systemImage: "link")
                                    }
                                }
                                .groupBoxStyle(UltraThinGroupBoxStyle())
                            }
                            
                            GroupBox  {
                                HStack {
                                    Text("Published:")
                                    Spacer()
                                    Label(item.published.formatted(date: .complete, time: .omitted), systemImage: "clock")
                                }
                            }
                            .groupBoxStyle(UltraThinGroupBoxStyle())
                            
                            Spacer()
                                .frame(height: 40)
                            
                            
                            GroupBox  {
                                HStack {
                                    
                                    Label("Platforms:", systemImage: "square.stack")
                                    Spacer()
                                    Spacer()
                                    
                                    ForEach(item.platform, id: \.self) { os in
                                        Spacer()
                                        Label(os.description, systemImage: os.symbolName)
                                        
                                    }
                                }
                            }
                            .groupBoxStyle(UltraThinGroupBoxStyle())
                            
                            GroupBox  {
                                
                                HStack {
                                    Spacer()
                                    ForEach(Array(item.minimumOSVersion), id: \.key) { key, value in
                                        Label("\(key.description): \(roundToNearest(value, places: 1))", systemImage: key.symbolName)
                                            Spacer()
                                    }
                                }
                            }
                            .groupBoxStyle(UltraThinGroupBoxStyle())
                            
                            
                        }
                        .groupBoxStyle(UltraThinGroupBoxStyle())
                        .padding()
                        
                        
                        
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(item.images, id: \.self) { image in
                                GroupBox {
                                    Image(image.image)
                                        .resizable()
                                        .clipped()
                                        .cornerRadius(10)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 200)
                                    Label(image.label, systemImage: "photo")
                                }
                                .frame(maxWidth: .infinity)
                                .groupBoxStyle(UltraThinGroupBoxStyle())
       
                            }
                        }
                        
                        .padding()
                        
                        GroupBox(label:
                                    Label("Sample", systemImage: "text.page.badge.magnifyingglass")
                            .padding()
                            .background(UltraThinView())
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            
                        )  {
                            item.content
                                .frame(minWidth: 1000)

                        }
                        .padding()
                        .groupBoxStyle(ThinGroupBoxStyle())
                        .frame(minWidth: 1000)
                    }
                   
                    
                } else {
                    
                    ContentUnavailableView {
                        Label("No Item Selected", systemImage: "square.dashed")
                    } description: {
                        Text("Select an item on the left to view its details.")
                    }
                    
                }
                

            
        }
        .toolbar {
            
            
            HStack {
                Image(ItemInput?.logo ?? "")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 44, height: 44)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                Spacer()
                Text(ItemInput?.name ?? "‎ ")
                    .bold()
                    .font(.largeTitle)
            }
            
            
            
        }
        
        
        
    }
}

#Preview {
    ItemDetailView(ItemInput: SwiftGlass_Item)
}
