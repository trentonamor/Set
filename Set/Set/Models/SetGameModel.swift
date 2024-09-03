//
//  SetGameModel.swift
//  Set
//
//  Created by Trenton Parrotte on 8/13/24.
//

import Foundation

struct SetGameModel {
    private(set) var deck: [Card]
    private(set) var cardsInPlay: [Card]
    
    init(cardContentFactory: (Int) -> SetCardContent) {
        self.deck = []
        self.cardsInPlay = []
        
        for i in 0..<Constants.cardsInDeck {
            let content = cardContentFactory(i)
            let card = Card(content: content)
            self.deck.append(card)
        }
    }
    
    mutating func shuffle() {
        self.deck.shuffle()
    }
    
    mutating func choose(card: Card) {
        print("Chose \(card)")
    }
    
    private struct Constants {
        static let cardsInDeck: Int = 81
    }
}
