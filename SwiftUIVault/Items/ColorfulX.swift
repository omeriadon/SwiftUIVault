    //
    //  ColorfulX.swift
    //  SwiftUIVault
    //
    //  Created by Adon Omeri on 21/4/2025.
    //

import Foundation
import SwiftUI
import ColorfulX



    //MARK: - SwiftGlass
struct ColorfulX_View: View {
    
    @State var selectedPreset: ColorPreset = .appleIntelligence
    
    @State var speed: Double = 1.0
    @State var bias: Double = 0.01
    @State var noise: Double = 1
    @State var duration: TimeInterval = 3.5
    @State var scale: Double = 1
    @State var frameLimit: Int = 60
    
    
    var body: some View {
        
        
        
        ZStack {
            
            ColorfulView(color: selectedPreset.colors, speed: $speed, bias: $bias, noise: $noise, transitionSpeed: $duration, frameLimit: $frameLimit, renderScale: $scale)
            
            VStack(alignment: .leading) {
                GroupBox {
                    Picker("Color Preset:", selection: $selectedPreset) {
                        ForEach(ColorPreset.allCases) { preset in
                            Text(preset.rawValue.capitalized).tag(preset)
                        }
                    }
                    .pickerStyle(.menu)
                    
                    HStack {
                        Text("Speed: \(roundToNearest(speed, places: 2))")
                        Slider(value: $speed, in: 0.0 ... 10.0, step: 0.5)
                    }
                    
                    HStack {
                        Text("Bias: \(roundToNearest(bias, places: 6))")
                        Slider(value: $bias, in: 0.000001 ... 0.01, step: 0.001)
                    }
                    
                    HStack {
                        Text("Noise: \(roundToNearest(noise, places: 2))")
                        Slider(value: $noise, in: 0 ... 300, step: 10)
                    }
                    
                    HStack {
                        Text("Duration: \(roundToNearest(duration, places: 2))")
                        Slider(value: $duration, in: 0.0 ... 10.0, step: 0.5)
                    }
                    
                    HStack {
                        Text("Frame Limit: \(frameLimit)")
                        Picker("", selection: $frameLimit) {
                            ForEach([0, 15, 30, 60], id: \.self) { frame in
                                Text("\(frame)").tag(frame)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    HStack {
                        Text("Scale: \(roundToNearest(scale, places: 2))")
                        Slider(value: $scale, in: 0.001 ... 2.0, step: 0.1)
                    }
                    
                }
                .frame(width: 400)
                .padding()
                .groupBoxStyle(UltraThinGroupBoxStyle())
                
                Spacer()
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding()
        .frame(height: 500)
        
        
    }
}



let ColorfulX_Images: [LabelledImage] = [
    
]

let ColorfulX_Item = Item(
    id: UUID(),
    name: "ColorfulX",
    description: "High performance gradient view for SwiftUI, AppKit, UIKit",
    logo: "ColorfulX-logo",
    link: URL(string: "https://github.com/Lakr233/ColorfulX")!,
    creator: "Lakr233",
    published: dateText(from: "2023-12-01T14:37:00Z"),
    content: AnyView(ColorfulX_View()),
    images: ColorfulX_Images,
    platform: [.iOS, .macOS, .macCatalyst, .tvOS, .visionOS],
    minimumOSVersion: [
        .iOS: 14.0,
        .macOS: 11.0,
        .macCatalyst: 14.0,
        .tvOS: 14.0,
        .visionOS: 1.0
    ]
)


#Preview {
    PreviewView()
}




struct PreviewView: View {
    
    
    
    
    var body: some View {
        ZStack {
            
            ColorfulX_View()
            
                //            ItemDetailView(ItemInput: ColorfulX_Item)
            
            
        }
        
    }
}
