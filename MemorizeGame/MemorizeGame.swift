//
//  MemorizeGame.swift
//  MemorizeGame
//
//  Created by Vladimir Vodolazkiy on 14.07.2023.
//

import Foundation

struct MemoryGame <CardContent> {
    
    var cards : Array <Card>
    
    init(numberOfPairOfCards : Int, createContent: (Int) -> CardContent) {
        // init empty array to hold cards
        cards = Array<Card>()
        // create 2x set of cards
        for cardIndex in 0..<numberOfPairOfCards {
            // add two identical cards to array
            let cardContent = createContent(cardIndex)
            cards.append(Card(content: cardContent))
            cards.append(Card(content: cardContent ))
        }
    }
    
    
    func chooseCard(_ card : Card) {
        
    }
    
    
    struct Card {
        var isFaceUp:   Bool = false
        var isWatched:  Bool = false
        var content:    CardContent
    }
}
