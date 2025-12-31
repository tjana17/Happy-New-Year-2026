//
//  GreetingTextView.swift
//  Happy New Year 2026
//
//  Created by Janarthanan Kannan on 31/12/25.
//

import SwiftUI

struct GreetingTextView: View {
    var body: some View {
        Text("Happy New Year\n2026")
            .font(.system(size: 76, weight: .heavy))
            .foregroundStyle(
                LinearGradient(
                    colors: [.yellow, .orange, .pink],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .shadow(color: .yellow.opacity(0.8), radius: 15)
            .padding(.top, 8)
    }
}

#Preview {
    GreetingTextView()
}
