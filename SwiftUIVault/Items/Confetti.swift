    //
    //  Confetti.swift
    //  SwiftUIVault
    //
    //  Created by Adon Omeri on 22/4/2025.
    //







import SwiftUI
import ConfettiSwiftUI

struct Confetti_View: View {
    
    @State var num1: Int = 0
    @State var num2: Int = 0
    @State var num3: Int = 0
    @State var num4: Int = 0
    @State var num5: Int = 0
    
    
    var body: some View {
        ScrollView {
            
            Spacer()
                .frame(height: 400)
            
            HStack(alignment: .bottom) {
                
                Spacer()
                    
                ZStack {
                    
                    Button {
                        num1 += 1
                    } label: {
                        Text("Trigger Animation")
                            .frame(width: 150, height: 40)
                    }
                    .buttonBorderShape(.roundedRectangle)
                    .buttonStyle(.borderedProminent)
                    .buttonRepeatBehavior(.enabled)
                    
                    ConfettiCannon(
                        trigger: $num1,
                        num: 10,
                        confettis: [.shape(.circle)],
                        colors: [.red, .yellow, .blue],
                        confettiSize: 5.0,
                        rainHeight: 400.0,
                        fadesOut: false,
                        opacity: 0.8,
                        openingAngle: Angle(degrees: 45),
                        closingAngle: Angle(degrees: 90),
                        radius: 200.0,
                        repetitions: 1,
                        repetitionInterval: 0.5
                    )
                }
                
                Spacer()
                
                ZStack {
                    Button {
                        num2 += 1
                    } label: {
                        Text("Trigger Animation")
                            .frame(width: 150, height: 40)
                    }
                    .buttonBorderShape(.roundedRectangle)
                    .buttonStyle(.borderedProminent)
                    .buttonRepeatBehavior(.enabled)
                    
                    ConfettiCannon(
                        trigger: $num2,
                        num: 5,
                        confettis: [.text("❤️"), .text("🔋"), .text("😁")],
                        colors: [.green, .blue, .teal],
                        confettiSize: 20.0,
                        rainHeight: 800.0,
                        fadesOut: true,
                        opacity: 1.0,
                        openingAngle: Angle(degrees: 30),
                        closingAngle: Angle(degrees: 150),
                        radius: 500.0,
                        repetitions: 2,
                        repetitionInterval: 1.5
                    )
                }
                Spacer()
                
                ZStack {
                    Button {
                        num3 += 1
                    } label: {
                        Text("Trigger Animation")
                            .frame(width: 150, height: 40)
                    }
                    .buttonBorderShape(.roundedRectangle)
                    .buttonStyle(.borderedProminent)
                    .buttonRepeatBehavior(.enabled)
                    
                    ConfettiCannon(
                        trigger: $num3,
                        num: 50,
                        confettis: [.shape(.slimRectangle), .shape(.circle)],
                        colors: [.pink, .yellow, .mint],
                        confettiSize: 8.0,
                        rainHeight: 300.0,
                        fadesOut: true,
                        opacity: 0.5,
                        openingAngle: Angle(degrees: 60),
                        closingAngle: Angle(degrees: 120),
                        radius: 150.0,
                        repetitions: 3,
                        repetitionInterval: 0.3
                    )
                }
                
                Spacer()
                ZStack {
                    Button {
                        num4 += 1
                    } label: {
                        Text("Trigger Animation")
                            .frame(width: 150, height: 40)
                    }
                    .buttonBorderShape(.roundedRectangle)
                    .buttonStyle(.borderedProminent)
                    .buttonRepeatBehavior(.enabled)
                    
                    ConfettiCannon(
                        trigger: $num4,
                        num: 15,
                        confettis: [.shape(.square), .shape(.triangle)],
                        colors: [.gray, .white, .black],
                        confettiSize: 12.0,
                        rainHeight: 1000.0,
                        fadesOut: false,
                        opacity: 0.9,
                        openingAngle: Angle(degrees: 0),
                        closingAngle: Angle(degrees: 180),
                        radius: 600.0,
                        repetitions: 1,
                        repetitionInterval: 2.0
                    )
                }
                Spacer()
                
                ZStack {
                    Button {
                        num5 += 1
                    } label: {
                        Text("Trigger Animation")
                            .frame(width: 150, height: 40)
                    }
                    .buttonBorderShape(.roundedRectangle)
                    .buttonStyle(.borderedProminent)
                    .buttonRepeatBehavior(.enabled)
                    
                    ConfettiCannon(
                        trigger: $num5,
                        num: 30,
                        confettis: [.shape(.circle), .shape(.slimRectangle), .shape(.roundedCross), .shape(.triangle)],
                        colors: [.red, .orange, .yellow, .green, .blue, .purple],
                        confettiSize: 15.0,
                        rainHeight: 700.0,
                        fadesOut: true,
                        opacity: 0.7,
                        openingAngle: Angle(degrees: 90),
                        closingAngle: Angle(degrees: 90),
                        radius: 400.0,
                        repetitions: 5,
                        repetitionInterval: 0.8
                    )
                }
                Spacer()
                
                
            }
            
            Spacer()
                .frame(height: 40)

            GroupBox {
                Label("Available Parameters", systemImage: "info.circle")
                Spacer()
                    .frame(height: 15)
                    Text("Trigger")
                    Text("Amount of confettis")
                    Text("List of shapes, text and images")
                    Text("List of colours applied to default shapes")
                    Text("Confetti scale")
                    Text("Height that confetti passes")
                    Text("Maximum opactity")
                    Text("Opening Angle")
                    Text("Closing Angle")
                    Text("Explosion radius")
                    Text("Repetitions")
                    Text("Repetition interval")
                    Text("Haptic Feedback")
                    

            }
            .groupBoxStyle(UltraThinGroupBoxStyle())

            
            
        }
        .padding()
    }
    
    

}


struct Confetti_Helper_View: View {
    
    @State var num:Int = 20
    @State var confettis:[ConfettiType] = ConfettiType.allCases
    @State var colors:[Color] = [.blue, .red, .green, .yellow, .pink, .purple, .orange]
    @State var confettiSize:CGFloat = 10.0
    @State var rainHeight: CGFloat = 600.0
    @State var fadesOut:Bool = true
    @State var opacity:Double = 1.0
    @State var openingAngle:Double = 60
    @State var closingAngle:Double = 120
    @State var radius:CGFloat = 300
    @State var repetitions:Int = 0
    @State var repetitionInterval:Double = 1.0
    
    var body: some View{
        ZStack{
            ConfettiCannon(
                trigger: $num,
                num: num,
                confettis: confettis,
                colors: colors,
                confettiSize: confettiSize,
                rainHeight: rainHeight,
                fadesOut: fadesOut,
                opacity: opacity,
                openingAngle: Angle(degrees: openingAngle),
                closingAngle: Angle(degrees: closingAngle),
                radius: radius,
                repetitions: repetitions,
                repetitionInterval: repetitionInterval)
            Button {
                num += 1
            } label: {
                Text("Trigger")
                    .background(ColorfulX_View())
                    .frame(width: 150, height: 100)
            }
        }
    }
}


let Confetti_Images: [LabelledImage] = [
    
]


let Confetti_Item = Item(
    id: UUID(),
    name: "Confetti",
    description: "Customize confetti animations.",
    logo: "Confetti-logo",
    link: URL(string: "https://github.com/simibac/ConfettiSwiftUI")!,
    creator: "simibac",
    published: dateText(from: "2020-08-17T14:37:00Z"),
    content: AnyView(Confetti_View()),
    images: Confetti_Images,
    platform: [.iOS, .macOS, .watchOS, .tvOS],
    minimumOSVersion: [
        .iOS: 14.0,
        .macOS: 11,
        .watchOS: 7.0,
        .tvOS: 14.0
        
    ]
)


#Preview {
    ConfettiPreviewView()
}




struct ConfettiPreviewView: View {
    
    
    
    
    var body: some View {
        ZStack {
            
            Confetti_View()
            
                //                            ItemDetailView(ItemInput: Confetti_Item)
            
            
        }
        
    }
}



