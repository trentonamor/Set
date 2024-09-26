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
            buttons
        }
        .padding(.vertical, 4)
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
    
    private var buttons: some View {
        HStack {
            resetButton
            drawButton
        }
    }
    
    private var drawButton: some View {
        Button("Draw 3 cards", action: {
            self.viewModel.draw()
        })
        .buttonStyle(BorderedProminentButtonStyle())
    }
    
    private var resetButton: some View {
        Button("Reset Game", action: {
            self.viewModel.reset()
        })
        .buttonStyle(BorderedProminentButtonStyle())
    }
}

#Preview {
    SetCardGameView(viewModel: SetGameViewModel())
}
