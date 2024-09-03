//
//  SetGameViewModel.swift
//  Set
//
//  Created by Trenton Parrotte on 8/13/24.
//

import SwiftUI

struct SetCardGameView: View {
    var viewModel: SetGameViewModel
    
    private let cardAspectRatio: CGFloat = 2/3
    private let spacing: CGFloat = 4
    
    var body: some View {
        cards
    }
    
    private var cards: some View {
        AspectVGrid(self.viewModel.deck, aspectRatio: self.cardAspectRatio) { card in
            CardView(card: card)
                .padding(spacing)
                .onTapGesture {
                    viewModel.choose(card)
                }
        }
    }
}

#Preview {
    SetCardGameView(viewModel: SetGameViewModel())
}
