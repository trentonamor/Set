//
//  Card.swift
//  Set
//
//  Created by Trenton Parrotte on 8/13/24.
//

import Foundation

extension SetGameModel {
    struct Card: Identifiable, CustomDebugStringConvertible {
        var isFaceUp: Bool = true
        let id = UUID()
        let content: SetCardContent
        
        var debugDescription: String {
            return "\(id): \(content) \(isFaceUp ? "Up" : "Down")"
        }
    }
    
    struct SetCardContent {
        let numberOfSymbols: Int
        let symbol: Symbol
        let shading: Shading
        let color: SetColor
    }
    
    enum Symbol: Int {
        case diamond
        case squiggle
        case circle
    }
    
    enum Shading: Int {
        case empty
        case filled
        case lined
    }
    
    enum SetColor: Int {
        case green
        case blue
        case pink
    }
}
