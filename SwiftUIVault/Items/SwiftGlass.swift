    //
    //  SwiftGlass.swift
    //  SwiftUIVault
    //
    //  Created by Adon Omeri on 21/4/2025.
    //

import Foundation
import SwiftUI
import SwiftGlass


    //MARK: - SwiftGlass
struct SwiftGlass_View: View {
    
    @State private var selectedMaterial: MaterialWrapper = .ultraThin
    
    @State private var displayMode: SwiftGlass.GlassBackgroundModifier.GlassBackgroundDisplayMode = .always
    @State private var radius: CGFloat = 32
    @State private var color: Color = .white
    @State private var material: Material = .ultraThinMaterial
    @State private var gradientOpacity: Double = 0.5
    @State private var gradientStyle: SwiftGlass.GlassBackgroundModifier.GradientStyle = .normal
    @State private var strokeWidth: CGFloat = 1.5
    @State private var shadowColor: Color = .white
    @State private var shadowOpacity: Double = 0.5
    @State private var shadowRadius: CGFloat? = nil
    
    var body: some View {
        
        
        ScrollView {
            
            LazyVStack(pinnedViews: .sectionHeaders) {
                
                Section {
                    Spacer()
                        .frame(height: 60)
                    
                    
                    Text("Default")
                    
                    
                        .frame(width: 100, height: 50)
                        .padding()
                        .glass()
                    
                    Spacer()
                        .frame(height: 80)
                }
                Section {
                    Text("")
                } header: {
                    Text("Customizeable")
                        .frame(width: 100, height: 50)
                        .padding()
                        .glass(displayMode: displayMode, radius: radius, color: color, material: material, gradientOpacity: gradientOpacity, gradientStyle: gradientStyle, strokeWidth: strokeWidth, shadowColor: shadowColor, shadowOpacity: shadowOpacity, shadowRadius: shadowRadius, shadowX: 0, shadowY: 5)
                }
                
                Spacer()
                    .frame(height: 30)
                
                Section {
                    GroupBox {
                        VStack(alignment: .leading, spacing: 30) {
                            
                            Picker("Display Mode", selection: $displayMode) {
                                Text("Always").tag(SwiftGlass.GlassBackgroundModifier.GlassBackgroundDisplayMode.always)
                                Text("Automatic").tag(SwiftGlass.GlassBackgroundModifier.GlassBackgroundDisplayMode.automatic)
                            }
                            .pickerStyle(.segmented)
                            .frame(width: 300)
                            
                            HStack {
                                Text("Radius: \(roundToNearest(radius, places: 1))")
                                Slider(value: $radius, in: 0...50)
                            }
                            
                            ColorPicker("Color", selection: $color)
                            
                            Picker("Material", selection: $selectedMaterial) {
                                ForEach(MaterialWrapper.allCases, id: \.self) { wrapper in
                                    Text(wrapper.rawValue).tag(wrapper)
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .onChange(of: selectedMaterial) { oldValue, newValue in
                                material = newValue.material
                            }
                            
                            HStack {
                                Text("Gradient Opacity: \(roundToNearest(gradientOpacity, places: 2))")
                                Slider(value: $gradientOpacity, in: 0...1)
                            }
                            
                            Picker("Gradient Style", selection: $gradientStyle) {
                                Text("Normal").tag(SwiftGlass.GlassBackgroundModifier.GradientStyle.normal)
                                Text("Reverted").tag(SwiftGlass.GlassBackgroundModifier.GradientStyle.reverted)
                            }
                            .pickerStyle(.segmented)
                            .frame(width: 300)
                            
                            HStack {
                                Text("Stroke Width: \(roundToNearest(strokeWidth, places: 2))")
                                Slider(value: $strokeWidth, in: 0...5)
                            }
                            
                            ColorPicker("Shadow Color", selection: $shadowColor)
                            
                            HStack {
                                Text("Shadow Opacity: \(roundToNearest(shadowOpacity, places: 2))")
                                Slider(value: $shadowOpacity, in: 0...1)
                            }
                            
                            HStack {
                                Text("Shadow Radius: \(roundToNearest(shadowRadius ?? 0, places: 1))")
                                Slider(value: Binding(
                                    get: { shadowRadius ?? 0.0 },
                                    set: { shadowRadius = $0 }
                                ), in: 0...50)
                            }
                            
                            Label("Horizontal and vertical shadow offset are also available.", systemImage: "info.circle")
                            
                            
                        }
                        .padding()
                    }
                    .groupBoxStyle(UltraThinGroupBoxStyle())
                    .padding()
                    
                }
                
                
            }
        }
        .padding()
        
    }
}



let SwiftGlass_Images: [LabelledImage] = [
.init(label: "iOS", image: "SwiftGlass-iOS"),
.init(label: "iPadOS", image: "SwiftGlass-iPadOS"),
.init(label: "macOS", image: "SwiftGlass-macOS"),
.init(label: "tvOS", image: "SwiftGlass-tvOS"),
.init(label: "watchOS", image: "SwiftGlass-watchOS"),
.init(label: "visionOS", image: "SwiftGlass-visionOS")
]

let SwiftGlass_Item = Item(
id: UUID(),
name: "SwiftGlass",
description: "Glass effect on any SwiftUI View",
logo: "SwiftGlass-logo",
link: URL(string: "https://github.com/1998code/SwiftGlass")!,
creator: "1998code",
published: dateText(from: "2025-04-20T14:37:00Z"),
content: AnyView(SwiftGlass_View()),
images: SwiftGlass_Images,
platform: [.all],
minimumOSVersion: [
.iOS: 15.0,
.macOS: 14.0,
.watchOS: 10.0,
.tvOS: 15.0,
.visionOS: 1.0
]
)


