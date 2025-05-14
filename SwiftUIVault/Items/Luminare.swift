    //
    //  Liquid.swift
    //  SwiftUIVault
    //
    //  Created by Adon Omeri on 22/4/2025.
    //






import Foundation
import SwiftUI
import Luminare


enum LuminareEnum: String, CaseIterable {
    case circle, square, triangle, star, macbook, visionpro, iphone, ipad, appletv, applewatch, figure, person, basketball
}




    //MARK: - SwiftGlass
struct Luminare_View: View {
    
    
    
    @State var button1 = false
    
    @State var button2 = false
    
    @State var button3 = false
    
    @State var button4 = false
    
    @State var toggle1 = false
    
    @State var valueAdjust1 = 0.1
    
    @State var picker1 = LuminareEnum.macbook
    
    @State var picker2 = LuminareEnum.star
    
    @State var color1 = Color.red
    
    @State var textField1 = ""
    
    
    
    
    
    var body: some View {
        
        
        
        
        LuminareSection(LocalizedStringKey("LuminareSection")) {
            Button {
                
            } label: {
                Text("LuminareButtonStyle")
            }
            .buttonStyle(LuminareButtonStyle())
            .frame(width: 300, height: 50)
            
            
            Button {
                
            } label: {
                Text("LuminareDestructiveButtonStyle")
            }
            .buttonStyle(LuminareDestructiveButtonStyle())
            .frame(width: 300, height: 50)
            
            
            Button {
                
            } label: {
                Text("LuminareCompactButtonStyle")
            }
            .buttonStyle(LuminareCompactButtonStyle())
            .frame(width: 300, height: 50)
            
            
            Button {
                
            } label: {
                Text("LuminareCosmeticButtonStyle")
            }
            .buttonStyle(LuminareCosmeticButtonStyle(Image(systemName: "circle")))
            .frame(width: 300, height: 50)
            
            LuminareToggle("LuminareToggle", isOn: $toggle1)
                .frame(width: 300, height: 50)
            
            
            LuminareValueAdjuster("LuminareValueAdjuster", info: LuminareInfoView("LuminareInfoView Description", .blue), value: $valueAdjust1, sliderRange: 0...10, suffix: "suffix", step: 1, lowerClamp: true, upperClamp: true, controlSize: .regular, decimalPlaces: 1)
            
            VStack {
                LuminarePicker(elements: LuminareEnum.allCases, selection: $picker1, columns: 4, roundBottom: false) { item in
                    
                    
                    
                    Group {
                        ZStack {
                            Image(nsImage: sfSymbolToNSImage(item.rawValue))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(10)
                                .frame(width: 70, height: 70)
                            
                        }
                        
                    }
                    .aspectRatio(1, contentMode: .fit)
                    
                }
                
                HStack {
                    Label("Default grey button background is currently unavoidable", systemImage: "info.circle")
                    Spacer()
                }
                .padding()
            }
            
            LuminareSliderPicker("LuminareSliderPicker", LuminareEnum.allCases, selection: $picker2, label: { LocalizedStringKey($0.rawValue.capitalized) }
            )
            
            
            LuminareColorPicker(color: $color1, colorNames: (
                red: LocalizedStringKey("Red"),
                green: LocalizedStringKey("Green"),
                blue: LocalizedStringKey("Blue")
            ))
            
            LuminareTextField("Placeholder", text: $textField1)
            
            
            
            
            
            
            GroupBox {
                Label("Also Available", systemImage: "info.circle")
                Spacer()
                    .frame(height: 15)
                Text("LuminareList")
                Text(".luminareModal(...), similar to LuminareColorPicker")
                
                
                
            }
            .groupBoxStyle(UltraThinGroupBoxStyle())
            
        }
        .padding()
        
    }
    
    
    
    
}





let Luminare_Images: [LabelledImage] = [
    
]

let Luminare_Item = Item(
    id: UUID(),
    name: "Luminare",
    description: "Collection of translucent, elegant pre-styled components for macOS",
    logo: "Luminare-logo",
    link: URL(string: "https://github.com/MrKai77/Luminare")!,
    creator: "MrKai77",
    published: dateText(from: "2024-04-03T14:37:00Z"),
    content: AnyView(Luminare_View()),
    images: Luminare_Images,
    platform: [.macOS],
    minimumOSVersion: [
        .macOS: 13
        
    ]
)


#Preview {
    LuminarePreviewView()
}




struct LuminarePreviewView: View {
    
    
    
    
    var body: some View {
        ZStack {
            
            Luminare_View()
            
                //                            ItemDetailView(ItemInput: Luminare_Item)
            
            
        }
        
    }
}




