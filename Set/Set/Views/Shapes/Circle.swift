//
//  Circle.swift
//  Set
//
//  Created by Trenton Parrotte on 9/18/24.
//

import SwiftUI

struct Circle: ShapeView {
    var color: Color
    
    var shading: SetGameModel.Shading
    
    
    var body: some View {
        
        Group {
            switch shading {
                case .empty:
                    Capsule(style: .circular)
                        .stroke(color, lineWidth: 4.0)
                case .filled:
                    Capsule(style: .circular)
                        .fill(color)
                case .lined:
                    Capsule(style: .circular)
                        .stroke(color, lineWidth: 4.0)
                        .linedFill(lineColor: color, shape: Capsule(style: .circular))
            }
        }
        .aspectRatio(2.0, contentMode: .fit)
    }
}

#Preview {
    VStack {
        Circle(color: .dynamicGreen, shading: .lined)
        Circle(color: .dynamicGreen, shading: .empty)
        Circle(color: .dynamicGreen, shading: .filled)
    }
    .padding()
}
