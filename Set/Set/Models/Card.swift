//
//  Card.swift
//  Set
//
//  Created by Trenton Parrotte on 8/13/24.
//

import Foundation

extension SetGameModel {
    struct Card: Identifiable, CustomDebugStringConvertible {
        var isSelected: Bool = false
        var matchState: MatchState = .none
        let id = UUID()
        let content: SetCardContent
        
        var debugDescription: String {
            return "\(id): \(content) \(isSelected ? "Selected" : "Not Selected")"
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

enum MatchState {
    case none
    case valid
    case invalid
}
