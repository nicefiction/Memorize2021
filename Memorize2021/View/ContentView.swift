// ContentView.swift

// MARK: - LIBRARIES -

import SwiftUI


struct ContentView: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @State private var cardCount: Int = 20
   
   
   
   // MARK: - PROPERTIES
   
   let emojis: Array<String> = [
      "🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "🐔", "🐧", "🐦", "🐤", "🦄"
   ]
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      return VStack {
         ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
               ForEach(emojis[0..<cardCount],
                       id: \.self) { (emoji: String) in
                  CardView(content: emoji)
                     .aspectRatio(2/3,
                                  contentMode: .fit)
               }
            }
         }
         .foregroundColor(.red)
//         Spacer()
//         HStack {
//            subtractCard
//               .disabled(cardCount == 1 ? true : false)
//               .opacity(cardCount == 1 ? 0.65 : 1.00)
//            Spacer()
//            Text("\(cardCount) \(cardCount == 1 ? "Card" : "Cards")")
//               .font(.callout)
//            Spacer()
//            addCard
//               .disabled(cardCount == emojis.count ? true : false)
//               .opacity(cardCount == emojis.count ? 0.65 : 1.00)
//         }
//         .font(.largeTitle)
//         .padding(.horizontal)
      }
   }
   
   
//   var addCard: some View {
//
//      return Button(action: {
//         cardCount += 1
//      }, label: {
//         Image(systemName: "plus.square")
//      })
//   }
//
//
//   var subtractCard: some View {
//
//      return Button(action: {
//         cardCount -= 1
//      }, label: {
//         Image(systemName: "minus.square")
//      })
//   }
}





// MARK: - PREVIEWS -

struct ContentView_Previews: PreviewProvider {
   
   static var previews: some View {
      
      ContentView()
         .preferredColorScheme(.light)
      ContentView()
         .preferredColorScheme(.dark)
   }
}
