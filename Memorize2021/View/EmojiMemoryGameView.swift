// EmojiMemoryGameView.swift

// MARK: - LIBRARIES -

import SwiftUI


struct EmojiMemoryGameView: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   //   @State private var cardCount: Int = 20
   @ObservedObject var emojiMemoryGame: EmojiMemoryGameViewModel
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      ScrollView {
         LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
            ForEach(emojiMemoryGame.cards) { (card: MemoryGameModel<String>.Card) in
               CardView(with: card)
                  .aspectRatio(2/3,
                               contentMode: .fit)
                  .onTapGesture {
                     // Show the intent of the user.
                     emojiMemoryGame.choose(card)
                  }
            }
         }
      }
      .foregroundColor(.red)
      .padding(.horizontal)
   }
}





// MARK: - PREVIEWS -

struct ContentView_Previews: PreviewProvider {
   
   static var previews: some View {
      
      let game: EmojiMemoryGameViewModel = EmojiMemoryGameViewModel()
      
      EmojiMemoryGameView(emojiMemoryGame: game)
         .preferredColorScheme(.light)
      EmojiMemoryGameView(emojiMemoryGame: game)
         .preferredColorScheme(.dark)
   }
}
