//
//  Stripe.swift
//  Set
//
//  Created by Trenton Parrotte on 9/18/24.
//

import Foundation
import SwiftUI

struct LinedFillModifier<S: Shape>: ViewModifier {
    var lineColor: Color
    var lineWidth: CGFloat
    var spacing: CGFloat
    var shape: S
    
    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { geometry in
                    let width = geometry.size.width
                    let height = geometry.size.height
                    let numberOfLines = Int(width / (lineWidth + spacing))
                    
                    ZStack {
                        ForEach(0..<numberOfLines, id: \.self) { index in
                            let xPosition = CGFloat(index) * (lineWidth + spacing)
                            
                            Path { path in
                                path.move(to: CGPoint(x: xPosition, y: 0))
                                path.addLine(to: CGPoint(x: xPosition, y: height))
                            }
                            .stroke(lineColor, lineWidth: lineWidth)
                        }
                    }
                }
            )
            .clipShape(shape) // Clip the lines to the shape's boundaries
    }
}

extension View {
    func linedFill<S: Shape>(lineColor: Color, lineWidth: CGFloat = 1, spacing: CGFloat = 5, shape: S) -> some View {
        self.modifier(LinedFillModifier(lineColor: lineColor, lineWidth: lineWidth, spacing: spacing, shape: shape))
    }
}


