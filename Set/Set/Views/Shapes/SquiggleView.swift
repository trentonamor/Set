//
//  SquiggleView.swift
//  Set
//
//  Created by Trenton Parrotte on 9/18/24.
//

import SwiftUI

struct Squiggle: Shape {
    let smallRadius: CGFloat = 20
    let largeRadius: CGFloat = 100
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            // Starting at the bottom-left corner
            path.move(to: CGPoint(x: 0, y: rect.midY))
            
            // Top wave
            path.addQuadCurve(
                to: CGPoint(x: rect.width * 0.5, y: rect.height * 0.4),
                control: CGPoint(x: rect.width * 0.25, y: 0)
            )
            
            path.addQuadCurve(
                to: CGPoint(x: rect.width, y: rect.midY),
                control: CGPoint(x: rect.width * 0.75, y: rect.height * 0.7)
            )
            
            // Bottom wave (mirroring the top wave)
            path.addQuadCurve(
                to: CGPoint(x: rect.width * 0.5, y: rect.height * 0.6),
                control: CGPoint(x: rect.width * 0.75, y: rect.height)
            )
            
            path.addQuadCurve(
                to: CGPoint(x: 0, y: rect.midY),
                control: CGPoint(x: rect.width * 0.25, y: rect.height * 0.3)
            )
        }
    }
}

struct SquiggleView: ShapeView {
    var color: Color
    var shading: SetGameModel.Shading
    
    var body: some View {
        
        Group {
            switch shading {
                case .empty:
                    Squiggle()
                        .stroke(color, lineWidth: 4.0)
                case .filled:
                    Squiggle()
                        .fill(color)
                case .lined:
                    Squiggle()
                        .stroke(color, lineWidth: 4.0)
                        .linedFill(lineColor: color, shape: Squiggle())
            }
        }
        .rotationEffect(.degrees(-30))
    }
}

#Preview {
    VStack {
        SquiggleView(color: .dynamicGreen, shading: .lined)
        SquiggleView(color: .dynamicGreen, shading: .empty)
        SquiggleView(color: .dynamicGreen, shading: .filled)
    }
    .padding()
}
