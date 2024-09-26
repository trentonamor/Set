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
    private(set) var chosenCards: [Card] = []
    
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
        if let cardIndex = self.chosenCards.firstIndex(where: { $0.id == card.id }) {
            // Remove card if already chosen
            self.chosenCards.remove(at: cardIndex)
        } else {
            // Select Card
            self.chosenCards.append(card)
        }
        
        if let cardIndex = self.cardsInPlay.firstIndex(where: { $0.id == card.id }) {
            self.cardsInPlay[cardIndex].isSelected = self.chosenCards.contains(where: { $0.id == card.id })
        }
        
        checkForMatch()
    }
    
    private mutating func checkForMatch() {
        guard self.chosenCards.count == 3,
                let cardIndex1 = self.cardsInPlay.firstIndex(where: {$0.id == self.chosenCards[0].id}),
                let cardIndex2 = self.cardsInPlay.firstIndex(where: {$0.id == self.chosenCards[1].id}),
                let cardIndex3 = self.cardsInPlay.firstIndex(where: {$0.id == self.chosenCards[2].id})
        else {
            var chosenIndex = 0
            for chosenCard in chosenCards {
                if let index = self.cardsInPlay.firstIndex(where: { $0.id == chosenCard.id }) {
                    self.cardsInPlay[index].matchState = .none
                }
                self.chosenCards[chosenIndex].matchState = .none
                chosenIndex += 1
            }
            return
        }
        
        let isMatched = self.hasMatch(for: \.content.numberOfSymbols) &&
                        self.hasMatch(for: \.content.symbol) &&
                        self.hasMatch(for: \.content.shading) &&
                        self.hasMatch(for: \.content.color)
        
        let matchState = self.getMatchState(for: isMatched)
        
        self.cardsInPlay[cardIndex1].matchState = matchState
        self.cardsInPlay[cardIndex2].matchState = matchState
        self.cardsInPlay[cardIndex3].matchState = matchState
    }
    
    private func getMatchState(for isMatched: Bool) -> MatchState {
        return isMatched ? .valid : .invalid
    }
    
    private func hasMatch<T: Equatable>(for keyPath: KeyPath<SetGameModel.Card, T>) -> Bool {
        let card1 = self.chosenCards[0]
        let card2 = self.chosenCards[1]
        let card3 = self.chosenCards[2]
            
        let allSame = card1[keyPath: keyPath] == card2[keyPath: keyPath] &&
                        card1[keyPath: keyPath] == card3[keyPath: keyPath]
            
        let allDifferent = card1[keyPath: keyPath] != card2[keyPath: keyPath] &&
                            card2[keyPath: keyPath] != card3[keyPath: keyPath] &&
                            card1[keyPath: keyPath] != card3[keyPath: keyPath]
            
        return allSame || allDifferent
    }
    
    mutating func draw() {
        for _ in 0..<3 {
            guard !self.deck.isEmpty else { return }
            let card = self.deck.removeFirst()
            self.cardsInPlay.append(card)
        }
    }
    
    private struct Constants {
        static let cardsInDeck: Int = 81
    }
}
