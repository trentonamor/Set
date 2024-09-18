//
//  Diamond.swift
//  Set
//
//  Created by Trenton Parrotte on 9/18/24.
//

import SwiftUI

struct DiamondView: ShapeView {
    var color: Color
    var shading: SetGameModel.Shading
    
    var body: some View {
        Group {
            switch shading {
                case .empty:
                    Rectangle()
                        .stroke(color, lineWidth: 4.0)
                case .filled:
                    Rectangle()
                        .fill(color)
                case .lined:
                    Rectangle()
                        .stroke(color, lineWidth: 4.0)
                        .linedFill(lineColor: color, shape: Rectangle())
            }
        }
        .aspectRatio(contentMode: .fit)
        .rotationEffect(.degrees(45))
        .scaleEffect(CGSize(width: 1.0, height: 0.5))
    }
}

#Preview {
    VStack {
        DiamondView(color: .dynamicGreen, shading: .lined)
        DiamondView(color: .dynamicGreen, shading: .empty)
        DiamondView(color: .dynamicGreen, shading: .filled)
    }
    .padding()
}
