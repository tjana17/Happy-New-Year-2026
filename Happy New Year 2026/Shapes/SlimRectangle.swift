//
//  SlimRectangle.swift
//  Happy New Year 2026
//
//  Created by Janarthanan Kannan on 31/12/25.
//

import SwiftUI

public struct SlimRectangle: Shape {
    public func path(in rect: CGRect) -> Path {
        
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: 4*rect.maxY/5))
        path.addLine(to: CGPoint(x: rect.maxX, y: 4*rect.maxY/5))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        return path
    }
}
