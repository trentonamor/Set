//
//  CardView.swift
//  Set
//
//  Created by Trenton Parrotte on 9/3/24.
//

import Foundation
import SwiftUI

struct CardView: View {
    typealias Card = SetGameModel.Card
    typealias Symbol = SetGameModel.Symbol
    typealias Shading = SetGameModel.Shading
    typealias SetColor = SetGameModel.SetColor
    
    let card: Card
    
    private var overlayColor: Color {
        switch card.matchState {
        case .invalid:
            return Color.dynamicRed.opacity(0.2)
        case .valid:
            return Color.dynamicGreen.opacity(0.2)
        default:
            return Color.dynamicBlue.opacity(0.2)
        }
    }
    
    var body: some View {
        SymbolView(content: card.content)
            .cardify(isFaceUp: true)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .fill(overlayColor)
                    .opacity(card.isSelected ? 1 : 0)
            )
    }
}

#Preview {
    typealias Card = SetGameModel.Card
    return VStack {
        HStack {
            CardView(card: Card(content: SetGameModel.SetCardContent(numberOfSymbols: 1, symbol: .circle, shading: .filled, color: .blue)))
            CardView(card: Card(content: SetGameModel.SetCardContent(numberOfSymbols: 2, symbol: .circle, shading: .empty, color: .blue)))
            CardView(card: Card(content: SetGameModel.SetCardContent(numberOfSymbols: 3, symbol: .circle, shading: .lined, color: .blue)))
        }
        HStack {
            CardView(card: Card(content: SetGameModel.SetCardContent(numberOfSymbols: 1, symbol: .diamond, shading: .filled, color: .green)))
            CardView(card: Card(content: SetGameModel.SetCardContent(numberOfSymbols: 2, symbol: .diamond, shading: .empty, color: .green)))
            CardView(card: Card(content: SetGameModel.SetCardContent(numberOfSymbols: 3, symbol: .diamond, shading: .lined, color: .green)))
        }
        HStack {
            CardView(card: Card(content: SetGameModel.SetCardContent(numberOfSymbols: 1, symbol: .squiggle, shading: .filled, color: .pink)))
            CardView(card: Card(content: SetGameModel.SetCardContent(numberOfSymbols: 2, symbol: .squiggle, shading: .empty, color: .pink)))
            CardView(card: Card(content: SetGameModel.SetCardContent(numberOfSymbols: 3, symbol: .squiggle, shading: .lined, color: .pink)))
        }
    }
}
