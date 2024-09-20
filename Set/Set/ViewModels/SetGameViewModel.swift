//
//  SetGameViewModel.swift
//  Set
//
//  Created by Trenton Parrotte on 8/13/24.
//

import Foundation
import SwiftUI

@Observable class SetGameViewModel {
    typealias Card = SetGameModel.Card
    
    private var model: SetGameModel
    
    var cardsInPlay: [Card] {
        return model.cardsInPlay
    }
    
    var deck: [Card] {
        return model.deck
    }
    
    init() {
        self.model = Self.createSetGame()
        self.shuffle()
        for _ in 0..<3 {
            self.draw()
        }
    }
    
    
    // MARK: Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: Card) {
        model.choose(card: card)
    }
    
    func draw() {
        model.draw()
    }
    
    // MARK: Helpers
    private static func createSetGame() -> SetGameModel {
        return SetGameModel { index in
            let numberOfSymbols = (index % 3) + 1
            let symbol = SetGameModel.Symbol(rawValue: (index / 3) % 3) ?? .diamond
            let shading = SetGameModel.Shading(rawValue: (index / 9) % 3) ?? .empty
            let color = SetGameModel.SetColor(rawValue: (index / 27) % 3) ?? .green
            
            return SetGameModel.SetCardContent(numberOfSymbols: numberOfSymbols, symbol: symbol, shading: shading, color: color)
        }
    }
    
    private static func getColor(_ color: SetGameModel.SetColor) -> Color {
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
