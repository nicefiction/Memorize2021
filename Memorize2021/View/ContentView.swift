// ContentView.swift

// MARK: - LIBRARIES -

import SwiftUI


struct ContentView: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   //   @State private var cardCount: Int = 20
   @ObservedObject var viewModel: EmojiMemoryGameViewModel
   
   
   
   // MARK: - PROPERTIES
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      ScrollView {
         LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
            ForEach(viewModel.cards) { (card: MemoryGameModel<String>.Card) in
               CardView(card: card)
                  .aspectRatio(2/3,
                               contentMode: .fit)
                  .onTapGesture {
                     // Show the intent of the user.
                     viewModel.choose(card)
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
      
      ContentView(viewModel: game)
         .preferredColorScheme(.light)
      ContentView(viewModel: game)
         .preferredColorScheme(.dark)
   }
}
