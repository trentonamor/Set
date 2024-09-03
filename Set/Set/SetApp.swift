//
//  SetApp.swift
//  Set
//
//  Created by Trenton Parrotte on 8/12/24.
//

import SwiftUI

@main
struct SetApp: App {
    @State private var game = SetGameViewModel()
    
    var body: some Scene {
        WindowGroup {
            SetCardGameView(viewModel: game)
        }
    }
}
