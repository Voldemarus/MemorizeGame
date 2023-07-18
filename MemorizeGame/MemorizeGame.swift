//
//  MemorizeGame.swift
//  MemorizeGame
//
//  Created by Vladimir Vodolazkiy on 14.07.2023.
//

import Foundation

struct MemoryGame <CardContent>  where CardContent : Equatable {
    
    private(set)  var cards: Array <Card>
    
    private var indexOfOpenedCard : Int?
    
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
        if let cardIndex = cards.firstIndex(where: {$0.id == card.id}) {
            if let openedIndex = indexOfOpenedCard,
               !cards[cardIndex].isFaceUp && !cards[cardIndex].isMatched {
                // у нас есть индекс ранее открытой карты, если содержимое карт совпадает
                // помечаем обе карты как совпавшие
                if cards[cardIndex].content == cards[indexOfOpenedCard!].content
                    {
                    cards[cardIndex].isMatched = true
                    cards[indexOfOpenedCard!].isMatched = true
                } else {
                    // Не совпало, разворачиваем обе карты обратно
                    // TODO! Маленькая задержка для юзера
                    cards[cardIndex].isFaceUp = false
                    cards[indexOfOpenedCard!].isFaceUp = false
                }
                indexOfOpenedCard = nil
            } else {
                // открываем карту, поскольку пары для нее пока нет
                cards[cardIndex].isFaceUp = true
                // и запоминаем ее индекс
                indexOfOpenedCard = cardIndex
            }
        }
    }
    
    //
    // Identifiable необходим для работы ForEach с использованием
    // Card в качестве перечисляемого / индексируемого элемента массива
    // Фактически, для этого необходимо поле id любого типа (String, Int)
    //

    struct Card : Identifiable{
        
        let id = UUID().uuidString
        
        var isFaceUp:   Bool = false
        var isMatched:  Bool = false
        var content:    CardContent
    }
}
