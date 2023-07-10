import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            GameView(game: EmojiMemoryGame())
        }
    }
}
