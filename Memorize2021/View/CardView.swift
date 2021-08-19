// CardView.swift

// MARK: - LIBRARIES -

import SwiftUI



struct CardView: View {
   
   // MARK: - NESTED TYPES
   
   private struct Dimension {
      
      static let cornerRadius: CGFloat = 25.0
      static let lineWidth: CGFloat = 3
      static let cardContentScale: CGFloat = 0.7
   }
   
   
   
   // MARK: - PROPERTIES
   
   // let card: MemoryGameModel<String>.Card
   private let card: EmojiMemoryGameViewModel.Card
   /// `1`We nested the `typealias` inside the `EmojiMemoryGameViewModel` class ,
   /// so the full type of the `typealis` is `EmojiMemoryGameViewModel.Card`
   /// `2`We can make the property `private` since we have an `init()`.
   /// No reason to make it `public` if we provide an `init()` to humans to set it up .
   
   let roundedRectangle: RoundedRectangle = RoundedRectangle(cornerRadius: CardView.Dimension.cornerRadius)
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      return GeometryReader { (geometryProxy: GeometryProxy) in
         ZStack {
            if card.isFaceUp {
               roundedRectangle
                  .foregroundColor(.white)
               roundedRectangle
                  ///`strokeBorder` draws the stroke _inside_ the Shape :
                  .strokeBorder(lineWidth: CardView.Dimension.lineWidth)
               Text(card.content)
                  .font(scaleCardContent(in: geometryProxy.size))
            } else if  card.isMatched {
               roundedRectangle
                  .opacity(0)
            } else {
               roundedRectangle
                  .fill()
            }
         }
      }
   }
   
   
   
   // MARK: - INITIALISER METHODS
   
   init(with card: EmojiMemoryGameViewModel.Card) {
      
      self.card = card
   }
   
   
   
   // MARK: - METHODS
   
   private
   func scaleCardContent(in size: CGSize)
   -> Font {
      
      return Font.system(size: min(size.width, size.height) * CardView.Dimension.cardContentScale)
   }
}





// MARK: - PREVIEWS -

// MARK: TODO
//struct CardView_Previews: PreviewProvider {
//
//   static var previews: some View {
//
//      let emojiMemoryGame = EmojiMemoryGameViewModel()
//      let card = emojiMemoryGame.cards[0]
//
//      CardView(with: card) // OLIVIER
//         .preferredColorScheme(.dark)
//   }
//}
