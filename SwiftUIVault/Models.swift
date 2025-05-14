    //
    //  Models.swift
    //  SwiftUIVault
    //
    //  Created by Adon Omeri on 21/4/2025.
    //

import Foundation
import SwiftUI
import ColorfulX


//MARK: - Item
struct Item: Identifiable, Hashable, Equatable {
    
    static func == (lhs: Item, rhs: Item) -> Bool {
        lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
        // misc
    let id: UUID
    
        // header
    let name: String
    let description: String
    let logo: String
    
    
        // credit
    let link: URL
    let creator: String
    
        // meta
    let published: Date
    
        // content
    let content: AnyView
    let images: [LabelledImage]
    
    
        // details
    let platform: [OSEnum]
    let minimumOSVersion: [OSEnum: Double]
    
        // user
    var isBookmarked: Bool = false
    
}


    //MARK: - LabelledImage
struct LabelledImage: Identifiable, Hashable {
    
    let id: UUID = UUID()
    
    let label: String
    let image: String
}

    //MARK: - OSEnum
enum OSEnum: String, CaseIterable, Hashable {
    case iOS, macOS, watchOS, tvOS, visionOS, macCatalyst, all
    
    var description: String {
        switch self {
            case .iOS: return "iOS"
            case .macOS: return "macOS"
            case .watchOS: return "watchOS"
            case .tvOS: return "tvOS"
            case .visionOS: return "visionOS"
            case .macCatalyst: return "Mac Catalyst"
            case .all: return "All Platforms"
        }
    }
    
    var symbolName: String {
        switch self {
            case .iOS: return "iphone"
            case .macOS: return "desktopcomputer.and.macbook"
            case .watchOS: return "applewatch.case.sizes"
            case .tvOS: return "appletv"
            case .visionOS: return "vision.pro"
            case .macCatalyst: return "macbook.and.ipad"
            case .all: return "square.stack.3d.up"
        }
    }
    
    
    
}



    //MARK: - dateText
func dateText(from string: String) -> Date {
    let formatter = ISO8601DateFormatter()
    if let date = formatter.date(from: string) {
        return date
    } else {
        return Date.distantFuture
    }
}

//MARK: - MaterialWrapper
enum MaterialWrapper: String, Identifiable, Hashable {

    case ultraThin = "Ultra Thin"
    case thin = "Thin"
    case regular = "Regular"
    case thick = "Thick"
    case ultraThick = "Ultra Thick"
    case bar = "Bar"
    
    var id: String { rawValue }
    
    var material: SwiftUI.Material {
        switch self {
            case .ultraThin: return .ultraThin
            case .thin: return .thin
            case .regular: return .regular
            case .thick: return .thick
            case .ultraThick: return .ultraThick
            case .bar: return .bar
            
        }
    }
    
    static var allCases: [MaterialWrapper] {
        return [.ultraThin, .thin, .regular, .thick, .ultraThick, .bar]
    }
}




//MARK: - roundToNearest

func roundToNearest(_ value: Double, places: Int) -> String {
    let multiplier = pow(10.0, Double(places))
    let roundedValue = (value * multiplier).rounded() / multiplier
    return String(format: "%.\(places)f", roundedValue)
}


//MARK: - UltraThinGroupBoxStyle
struct UltraThinGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            configuration.label
                .font(.headline)
            configuration.content
                .font(.body)
        }
        .padding()
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
    }
}

    //MARK: - ThinGroupBoxStyle
struct ThinGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            configuration.label
                .font(.headline)
            configuration.content
                .font(.body)
        }
        .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
    }
}


    //MARK: - ColorPreset
enum ColorPreset: String, CaseIterable, Identifiable {
    case sunrise, sunset, love, ocean, barbie, starry, jelly, lavandula, watermelon, dandelion, lemon, spring, summer, autumn, winter, neon, aurora, appleIntelligence, colorful
    
    var id: String { rawValue }
    
    var colors: [Color] {
        switch self {
            case .sunrise: return ColorfulPreset.sunrise.colors.map { Color($0) }
            case .sunset: return ColorfulPreset.sunset.colors.map { Color($0) }
            case .love: return ColorfulPreset.love.colors.map { Color($0) }
            case .ocean: return ColorfulPreset.ocean.colors.map { Color($0) }
            case .barbie: return ColorfulPreset.barbie.colors.map { Color($0) }
            case .starry: return ColorfulPreset.starry.colors.map { Color($0) }
            case .jelly: return ColorfulPreset.jelly.colors.map { Color($0) }
            case .lavandula: return ColorfulPreset.lavandula.colors.map { Color($0) }
            case .watermelon: return ColorfulPreset.watermelon.colors.map { Color($0) }
            case .dandelion: return ColorfulPreset.dandelion.colors.map { Color($0) }
            case .lemon: return ColorfulPreset.lemon.colors.map { Color($0) }
            case .spring: return ColorfulPreset.spring.colors.map { Color($0) }
            case .summer: return ColorfulPreset.summer.colors.map { Color($0) }
            case .autumn: return ColorfulPreset.autumn.colors.map { Color($0) }
            case .winter: return ColorfulPreset.winter.colors.map { Color($0) }
            case .neon: return ColorfulPreset.neon.colors.map { Color($0) }
            case .aurora: return ColorfulPreset.aurora.colors.map { Color($0) }
            case .appleIntelligence: return ColorfulPreset.appleIntelligence.colors.map { Color($0) }
            case .colorful: return ColorfulPreset.colorful.colors.map { Color($0) }
        }
    }
}

//MARK: - TabState
class TabState: ObservableObject {
    @Published var selectedTab: String = "General"
}

//MARK: - sfSymbolToNSImage
func sfSymbolToNSImage(_ name: String, pointSize: CGFloat = 48) -> NSImage {
    let config = NSImage.SymbolConfiguration(pointSize: pointSize, weight: .regular)
    return NSImage(systemSymbolName: name, accessibilityDescription: nil)?
        .withSymbolConfiguration(config) ?? NSImage()
}
