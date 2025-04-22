//
//  Liquid.swift
//  SwiftUIVault
//
//  Created by Adon Omeri on 22/4/2025.
//






import Foundation
import SwiftUI
import Liquid




    //MARK: - SwiftGlass
struct Liquid_View: View {
    
    
    
    @State var samples: Double = 8
    
    
    @State var number: Double = 1
    
    
    
    
    var body: some View {
        
        
        
        VStack {
            
            ZStack {
                Liquid()
                    .frame(width: 240, height: 240)
                    .foregroundColor(.blue)
                    .opacity(0.3)
                
                
                Liquid()
                    .frame(width: 220, height: 220)
                    .foregroundColor(.blue)
                    .opacity(0.6)
                
                Liquid(samples: 5)
                    .frame(width: 200, height: 200)
                    .foregroundColor(.blue)
                
                Text("Liquid").font(.largeTitle).foregroundColor(.white)
            }
            
            Spacer()
                .frame(height: 50)
            
            HStack {
                Text("Amount: \(Int(number))")
                Slider(value: $number, in: 1...10, step: 1)
            }
            
            
            
            ZStack {
                ForEach(0..<Int(number), id: \.self) { index in
                    let scale = CGFloat(index) * 30
                    let opacity = 0.2
                    
                    Liquid()
                        .frame(width: 100 + scale, height: 100 + scale)
                        .foregroundStyle(
                            Gradient(colors: [
                                .blue,
                                Color(hue: Double(index) / number, saturation: 0.7, brightness: 0.9)
                            ])
                        )
                        .opacity(opacity)
                }
            }
            .frame(width: 400, height: 400)
            .padding()
            
            
            
            
        }
        .padding()
        
        
    }
}



let Liquid_Images: [LabelledImage] = [
    
]

let Liquid_Item = Item(
    id: UUID(),
    name: "Liquid",
    description: "Add a Splash to Your SwiftUI Interface",
    logo: "Liquid-logo",
    link: URL(string: "https://github.com/maustinstar/liquid?tab=readme-ov-file")!,
    creator: "maustinstar",
    published: dateText(from: "2020-08-17T14:37:00Z"),
    content: AnyView(Liquid_View()),
    images: Liquid_Images,
    platform: [.iOS, .macOS, .watchOS, .tvOS],
    minimumOSVersion: [
        .iOS: 13.0,
        .macOS: 10.15,
        .watchOS: 6.0,
        .tvOS: 13.0
        
    ]
)


#Preview {
    LiquidPreviewView()
}




struct LiquidPreviewView: View {
    
    
    
    
    var body: some View {
        ZStack {
            
            Liquid_View()
            
                //                            ItemDetailView(ItemInput: Liquid_Item)
            
            
        }
        
    }
}



