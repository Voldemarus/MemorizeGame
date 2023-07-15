//
//  MemorizeGameApp.swift
//  MemorizeGame
//
//  Created by Vladimir Vodolazkiy on 09.07.2023.
//

import SwiftUI

@main
struct MemorizeGameApp: App {
    
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel : game)
        }
    }
}
