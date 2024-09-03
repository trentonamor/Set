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
    
    let card: Card
    
    var body: some View {
        Text("X")
            .cardify(isFaceUp: true)
    }
}

#Preview {
    typealias Card = SetGameModel.Card
    return CardView(card: Card(content: SetGameModel.SetCardContent(numberOfSymbols: 1, symbol: .circle, shading: .filled, color: .blue)))
}
