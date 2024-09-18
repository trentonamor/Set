//
//  SymbolView.swift
//  Set
//
//  Created by Trenton Parrotte on 9/18/24.
//

import Foundation
import SwiftUI

protocol ShapeView: View {
    var color: Color { get set }
    var shading: SetGameModel.Shading { get set }
}

struct SymbolView: View {
    let content: SetGameModel.SetCardContent
    
    var body: some View {
        Group {
            let color = self.getColorForSetColor(content.color)
            let shading = content.shading
            switch content.symbol {
                case .diamond:
                    DiamondView(color: color, shading: shading)
                case .circle:
                    Circle(color: color, shading: shading)
                case .squiggle:
                    SquiggleView(color: color, shading: shading)
            }
        }
        .foregroundStyle(self.getColorForSetColor(content.color))
    }
}

extension SymbolView {
    private func getColorForSetColor(_ color: SetGameModel.SetColor) -> Color {
        switch color {
            case .green:
                return .dynamicGreen
            case .blue:
                return .dynamicBlue
            case .pink:
                return .dynamicPink
        }
    }
}

#Preview {
    VStack {
        SymbolView(content: SetGameModel.SetCardContent(numberOfSymbols: 1, symbol: .squiggle, shading: .empty, color: .green))
        SymbolView(content: SetGameModel.SetCardContent(numberOfSymbols: 1, symbol: .circle, shading: .filled, color: .blue))
        SymbolView(content: SetGameModel.SetCardContent(numberOfSymbols: 1, symbol: .diamond, shading: .lined, color: .pink))
    }
    .padding()
}
