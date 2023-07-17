//
//  MemorizeGame.swift
//  MemorizeGame
//
//  Created by Vladimir Vodolazkiy on 14.07.2023.
//

import Foundation

struct MemoryGame <CardContent> {
    
    private(set)  var cards: Array <Card>
    
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
    
    
    mutating func chooseCard(_ card : Card) {
        let cardIndex = cards.firstIndex(where: {$0.id == card.id})
        if let cardIndex {
           cards[cardIndex].isFaceUp.toggle()
        }
        print("cards - \(cards)")
    }
    
    //
    // Identifiable необходим для работы ForEach с использованием
    // Card в качестве перечисляемого / индексируемого элемента массива
    // Фактически, для этого необходимо поле id любого типа (String, Int)
    //

    struct Card : Identifiable{
        
        let id = UUID().uuidString
        
        var isFaceUp:   Bool = true
        var isWatched:  Bool = false
        var content:    CardContent
    }
}
