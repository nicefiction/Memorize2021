// CardView.swift

// MARK: - LIBRARIES -

import SwiftUI



struct CardView: View {
   
   // MARK: - PROPERTIES
   
   let card: MemoryGameModel<String>.Card
   let roundedRectangle: RoundedRectangle = RoundedRectangle(cornerRadius: 25.0)
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      return ZStack {
         if card.isFaceUp {
            roundedRectangle
               .foregroundColor(.white)
            roundedRectangle
               ///`strokeBorder` draws te stroke _inside_ the Shape :
               .strokeBorder(lineWidth: 3)
            Text(card.content)
               .font(.largeTitle)
         } else {
            roundedRectangle
               .fill()
         }
      }
   }
}





// MARK: - PREVIEWS -

//struct CardView_Previews: PreviewProvider {
//
//   static var previews: some View {
//
//      let card =  // OLIVIER
//
//      CardView(card: card) // OLIVIER
//         .preferredColorScheme(.dark)
//   }
//}
