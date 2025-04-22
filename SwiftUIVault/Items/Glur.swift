//
//  Glur.swift
//  SwiftUIVault
//
//  Created by Adon Omeri on 21/4/2025.
//


import Foundation
import SwiftUI
import Glur



    //MARK: - SwiftGlass
struct Glur_View: View {
    

    @State var radius: Double = 8.0
    @State var offset: Double = 0.3
    @State var interpolation: Double = 0.4
    @State var direction: BlurDirection = .down
    
    var body: some View {
        
        
        
        VStack {
            
            GroupBox {
                HStack {
                    Text("Radius: \(roundToNearest(radius, places: 2))")
                    Slider(value: $radius, in: 0...40, step: 1)
                }
                HStack {
                    Text("Offset: \(roundToNearest(offset, places: 2))")
                    Slider(value: $offset, in: 0...1, step: 0.02)
                }
                HStack {
                    Text("Interpolation: \(roundToNearest(interpolation, places: 2))")
                    Slider(value: $interpolation, in: 0...1, step: 0.05)
                }
                HStack {
                    Text("Direction: \(direction)")
                    Picker("", selection: $direction) {
                        Text("Up").tag(BlurDirection.up)
                        Text("Down").tag(BlurDirection.down)
                        Text("Left").tag(BlurDirection.left)
                        Text("Right").tag(BlurDirection.right)
                        
                    }
                    .pickerStyle(.segmented)
                }
            }
            
            .groupBoxStyle(UltraThinGroupBoxStyle())
            
            Image("Glur-placeholder")
            
                .resizable()
                .frame(width: 200, height: 200)
                .padding()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .glur(radius: radius, // The total radius of the blur effect when fully applied.
                      offset: offset, // The distance from the view's edge to where the effect begins, relative to the view's size.
                      interpolation: interpolation, // The distance from the offset to where the effect is fully applied, relative to the view's size.
                      direction: direction // The direction in which the effect is applied.
                )
                .overlay(alignment: .bottomLeading) {
                    VStack(alignment: .leading) {
                        
                        LinearGradient(gradient: Gradient(stops: [.init(color: .orange, location: 0), .init(color: .red, location: 1)]), startPoint: .leading, endPoint: .trailing)
                            .frame(width: 90, height: 70)
                            .mask(Text("Glur").font(.largeTitle).bold())
                            
                    }
                    .padding()
                }
            
            
        }
        .padding()
        
        
    }
}



let Glur_Images: [LabelledImage] = [
    .init(label: "Compare with other blurs", image: "Glur-compare")
]

let Glur_Item = Item(
    id: UUID(),
    name: "Glur",
    description: "Better, efficient progressive blurs",
    logo: "Glur-logo",
    link: URL(string: "https://github.com/joogps/Glur?tab=readme-ov-file")!,
    creator: "joogps",
    published: dateText(from: "2023-06-11T14:37:00Z"),
    content: AnyView(Glur_View()),
    images: Glur_Images,
    platform: [.all],
    minimumOSVersion: [
        .iOS: 15.0,
        .macOS: 12.0,
        .watchOS: 8.0,
        .tvOS: 15.0,
        .visionOS: 1.0
    ]
)


#Preview {
    GlurPreviewView()
}




struct GlurPreviewView: View {
    
    
    
    
    var body: some View {
        ZStack {
            
            Glur_View()
            
//                            ItemDetailView(ItemInput: Glur_Item)
            
            
        }
        
    }
}

