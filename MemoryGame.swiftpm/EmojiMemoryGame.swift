//
//  EmojiMemoryGame.swift
//  MemoryGame
//
//  Created by lzheng on 2023/7/5.
//

import SwiftUI
//viewModel is the gate keeper between view and model
class EmojiMemoryGame: ObservableObject {
    // ViewModel access control of the Model
    private static let emojis = ["🐸", "🐻‍", "🐹", "🐻‍❄️", "🐥", "🐤", "🐒", "🦆", "🐣", "🐴", "🦉", "🥭", "🍍", "🍆", "🥬", "🌽", "🥕", "🥔", "🧄", "🍠", "🍑", "🍓", "🍎", "🍌", "🍉", "🍐", "🍊", "🍋", "🍒", "🥥"]

    private static func createModel(numberOfPairs: Int) -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: numberOfPairs) { index in
            emojis[index]
        }
    }
    @Published var model: MemoryGame<String> = createModel(numberOfPairs: 5)

    var cards: [MemoryGame<String>.Card] {
        return self.model.cards
    }
    
    // MARK: Intent(s）
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
