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
        VStack(spacing: 0) {
            ForEach(0..<content.numberOfSymbols, id: \.self) { _ in
                self.symbolView(for: content.symbol, shading: content.shading)
                    .frame(maxHeight: 300) // This will ensure the symbols are a consistent size
            }
        }
        .padding()
    }
    
    // Adjust spacing based on the number of symbols
    private func calculateSpacing(for numberOfSymbols: Int) -> CGFloat {
        switch numberOfSymbols {
        case 1:
            return 40 // Large spacing for one symbol
        case 2:
            return 20 // Medium spacing for two symbols
        case 3:
            return 10 // Smaller spacing for three symbols
        default:
            return 0 // Fallback case
        }
    }
    
    @ViewBuilder
    private func symbolView(for symbol: SetGameModel.Symbol, shading: SetGameModel.Shading) -> some View{
        Group {
            let color = self.getColorForSetColor(content.color)
            switch content.symbol {
                case .diamond:
                    DiamondView(color: color, shading: shading)
                case .circle:
                    Circle(color: color, shading: shading)
                case .squiggle:
                    SquiggleView(color: color, shading: shading)
            }
        }
    }

    
    // Function to calculate the maximum symbol size to fit 3 symbols (the maximum count)
    private func maxSymbolSize(in size: CGSize) -> CGFloat {
        let maxSymbols = 3 // Assuming the max number of symbols is 3
        return min(size.width, size.height) / CGFloat(maxSymbols)
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
        SymbolView(content: SetGameModel.SetCardContent(numberOfSymbols: 2, symbol: .circle, shading: .filled, color: .blue))
        SymbolView(content: SetGameModel.SetCardContent(numberOfSymbols: 3, symbol: .diamond, shading: .lined, color: .pink))
    }
    .padding()
}
