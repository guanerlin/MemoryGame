//
//  MemoryGame.swift
//  MemoryGame
//
//  Created by lzheng on 2023/7/5.
//

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards = [Card]()
    private var indexOfFaceUpCard: Int?
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        for i in 0..<numberOfPairsOfCards {
            cards.append(Card(content: createCardContent(i), id: i * 2))
            cards.append(Card(content: createCardContent(i), id: i * 2 + 1))
        }
    }
    
    mutating func choose(card: Card) {
        if let index = cards.firstIndex(where: { $0.id == card.id }), !cards[index].isFaceUp, !cards[index].isMatched {
            if let indexOfPreFaceUpCard = indexOfFaceUpCard, cards[indexOfPreFaceUpCard].content == cards[index].content {
                self.cards[indexOfPreFaceUpCard].isMatched = true
                self.cards[index].isMatched = true
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
            }
            
            indexOfFaceUpCard = index
            cards[index].isFaceUp = true
            
        } else {
            print("cannot find this card in the Model or the card is already face up")
        }
    }

    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        let id: Int
    }
}
