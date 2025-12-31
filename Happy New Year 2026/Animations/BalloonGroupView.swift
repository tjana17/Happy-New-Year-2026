//
//  BalloonGroupView.swift
//  Happy New Year 2026
//
//  Created by Janarthanan Kannan on 31/12/25.
//

import SwiftUI

struct BalloonGroupView: View {

    @State private var floatUp = false

    var body: some View {
        VStack(spacing: 0) {

            HStack(spacing: -10) {
                BalloonView(color: .red, swayDuration: 3, swayOffset: 12)
                BalloonView(color: .pink, swayDuration: 4, swayOffset: 10)
                BalloonView(color: .orange, swayDuration: 3.5, swayOffset: 14)
                BalloonView(color: .purple, swayDuration: 4.2, swayOffset: 11)
                BalloonView(color: .blue, swayDuration: 3.8, swayOffset: 13)
            }

            
        }
        .offset(y: floatUp ? -150 : 500)
        .animation(
            .easeInOut(duration: 6)
                .repeatForever(autoreverses: true),
            value: floatUp
        )
        .onAppear {
            floatUp = true
        }
    }
}


struct BalloonView: View {
    let color: Color
    let swayDuration: Double
    let swayOffset: CGFloat

    @State private var sway = false

    var body: some View {
        VStack(spacing: 0) {

            // Balloon body
            ZStack {
                Ellipse()
                    .fill(
                        RadialGradient(
                            gradient: Gradient(colors: [
                                color.opacity(0.9),
                                color
                            ]),
                            center: .topLeading,
                            startRadius: 10,
                            endRadius: 80
                        )
                    )

                // Shine
                Ellipse()
                    .fill(Color.white.opacity(0.35))
                    .frame(width: 15, height: 30)
                    .offset(x: -15, y: -20)
            }
            .frame(width: 60, height: 80)

            // String
            BalloonString(sway: sway)
                .stroke(Color.white.opacity(0.6), lineWidth: 1)
                .frame(height: 120)
        }
        .offset(x: sway ? swayOffset : -swayOffset)
        .animation(
            .easeInOut(duration: swayDuration)
                .repeatForever(autoreverses: true),
            value: sway
        )
        .onAppear {
            sway = true
        }
    }
}


struct BalloonString: Shape {
    var sway: Bool

    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: 0))

        path.addCurve(
            to: CGPoint(x: rect.midX, y: rect.maxY),
            control1: CGPoint(
                x: rect.midX + (sway ? 20 : -20),
                y: rect.maxY * 0.3
            ),
            control2: CGPoint(
                x: rect.midX + (sway ? -20 : 20),
                y: rect.maxY * 0.6
            )
        )

        return path
    }
}


#Preview {
    BalloonGroupView()
}
