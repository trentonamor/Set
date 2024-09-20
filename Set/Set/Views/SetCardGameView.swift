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
        VStack {
            cards
            drawButton
        }
        .padding()
    }
    
    private var cards: some View {
        AspectVGrid(self.viewModel.cardsInPlay, aspectRatio: self.cardAspectRatio) { card in
            CardView(card: card)
                .padding(spacing)
                .onTapGesture {
                    self.viewModel.choose(card)
                }
        }
    }
    
    private var drawButton: some View {
        Button("Draw 3 cards", action: {
            self.viewModel.draw()
        })
        .buttonStyle(BorderedProminentButtonStyle())
    }
}

#Preview {
    SetCardGameView(viewModel: SetGameViewModel())
}
