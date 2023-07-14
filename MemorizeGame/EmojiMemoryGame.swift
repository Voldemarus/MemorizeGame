//
//  EmojiMemoryGame.swift
//  MemorizeGame
//
//  Created by Vladimir Vodolazkiy on 14.07.2023.
//

import SwiftUI

//
// String as a CardContent
//

func makeCardContent(_ index: Int) -> String {
    return "😎"
}


class EmojiMemoryGame {
    
    // class property
    static let emojis = ["🚗", "🚕", "🚙", "🚌", "🚎",
                         "🚲", "🩼", "🚲", "🚔", "🚃",
                         "✈️", "⛵️", "🚀", "⚓️", "🪝",
                         "🚁", "🛟", "⛽️"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String> (numberOfPairOfCards : 4) { index in
            EmojiMemoryGame.emojis[index]
        }
    }
    
    private var model : MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    var cards:  Array<MemoryGame<String>.Card>  {
        return model.cards
    }
    
    
}
