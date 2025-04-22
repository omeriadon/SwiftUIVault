//
//  Shiny.swift
//  SwiftUIVault
//
//  Created by Adon Omeri on 21/4/2025.
//




import Foundation
import SwiftUI
import Shiny




    //MARK: - SwiftGlass
struct Shiny_View: View {
    
    
    
    @State var glossyColor: Color = .green
    
    @State var hyperGlossyColor: Color = .blue
    
    @State var matteColor: Color = .orange
    
    @State var glossyIntensity: CGFloat = 0.5
    
    @State var hyperGlossyIntensity: CGFloat = 1.0
    
    @State var matteIntensity: CGFloat = 0.5

    
    var body: some View {
        
        
        
        VStack {
            
            GroupBox {
                Text("Shiny")
                    .font(.largeTitle)
                    .bold()
                    .shiny()
            }
            .frame(width: 200, height: 200)
            .groupBoxStyle(UltraThinGroupBoxStyle())
            
            
                HStack{
                    
                    Spacer()
                    VStack {
                        
                        Text("Color: green\nIntensity: 0.5")
                        Text("Glossy")
                            .shiny(.glossy(NSColor(glossyColor), intensity: glossyIntensity))
                            .font(.largeTitle)
                            .bold()
                    }
                    Spacer()
                    
                    Text("Iridescent")
                        .shiny(.iridescent)
                        .font(.largeTitle)
                        .bold()
 
                    Spacer()
                    
                    Text("Rainbow")
                        .shiny(.rainbow)
                        .font(.largeTitle)
                        .bold()

                    Spacer()
                    VStack {
                        
                        Text("Color: blue\nIntensity: 1.0")

                        Text("HyperGlossy")
                            .shiny(.hyperGlossy(NSColor(hyperGlossyColor), intensity: hyperGlossyIntensity))
                            .font(.largeTitle)
                            .bold()
                    }

                    Spacer()
                    
                    VStack {
                        
                        Text("Color: orange\nIntensity: 0.5")

                        Text("Matte")
                            .shiny(.matte(NSColor(matteColor), intensity: matteIntensity))
                            .font(.largeTitle)
                            .bold()
                    }
                        
                    Spacer()
                    
                }
            Spacer()
                .frame(height: 50)
            
            
        }
        .padding()
        
        
    }
}



let Shiny_Images: [LabelledImage] = [
    
]

let Shiny_Item = Item(
    id: UUID(),
    name: "Shiny",
    description: "Add motion-based texture to your SwiftUI views",
    logo: "Shiny-logo",
    link: URL(string: "https://github.com/maustinstar/shiny")!,
    creator: "maustinstar",
    published: dateText(from: "2020-07-31T14:37:00Z"),
    content: AnyView(Shiny_View()),
    images: Shiny_Images,
    platform: [.iOS, .macOS],
    minimumOSVersion: [
        .iOS: 14.0,
        .macOS: 11.0,

    ]
)


#Preview {
    ShinyPreviewView()
}




struct ShinyPreviewView: View {
    
    
    
    
    var body: some View {
        ZStack {
            
            Shiny_View()
            
                //                            ItemDetailView(ItemInput: Shiny_Item)
            
            
        }
        
    }
}


