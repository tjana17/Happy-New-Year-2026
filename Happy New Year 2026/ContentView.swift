//
//  ContentView.swift
//  Happy New Year 2026
//
//  Created by Janarthanan Kannan on 31/12/25.
//

import SwiftUI
internal import Combine

struct ContentView: View {
    
    var body: some View {
        
        NewYear2026View()
        
    }
}

struct NewYear2026View: View {
    
    @State private var counter = 10
    @State private var showCelebration = false
    @State private var floatUp = false
    @State private var fireworkTrigger = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            // 🌑 Background
            Color.black.ignoresSafeArea()
            
            // 🎆 Fireworks
            if showCelebration {
                FireworkCenterView()
            }
            
            // ⏱ Countdown
            if !showCelebration {
                Text("\(counter)")
                    .font(.system(size: 120, weight: .bold))
                    .foregroundColor(.white)
                    .transition(.scale)
            }
            
            // 🎈 Celebration Content
            if showCelebration {
                VStack(spacing: 20) {
                    
                    // Balloons + text flying
                    BalloonGroupView()
                    
                }
                .offset(y: floatUp ? -150 : 400)
                .animation(
                    .easeInOut(duration: 4).repeatForever(autoreverses: true),
                    value: floatUp
                )
                VStack {
                    // Text attached at the string ends
                    GreetingTextView()
                }
                .offset(y: floatUp ? -150 : 400)
                .animation(
                    .easeInOut(duration: 4),
                    value: floatUp
                )
            }
        }
        .onReceive(timer) { _ in
            if counter > 1 {
                counter -= 1
            } else {
                showCelebration = true
                timer.upstream.connect().cancel()
                
                withAnimation {
                    floatUp = true
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

