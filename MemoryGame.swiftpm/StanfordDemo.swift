import SwiftUI

@main
struct StanfordDemo: App {
    //test ???
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: EmojiMemoryGame())
        }
    }
}
