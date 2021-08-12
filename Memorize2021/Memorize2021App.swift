// Memorize2021App.swift

// MARK: - LIBRARIES -

import SwiftUI



@main
struct Memorize2021App: App {
   
   // MARK: - PROPERTIES
   
   let game: EmojiMemoryGameViewModel = EmojiMemoryGameViewModel()
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some Scene {
      
      WindowGroup {
         
         ContentView(viewModel: game)
      }
   }
}
