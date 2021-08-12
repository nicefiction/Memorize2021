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
      .padding(.horizontal)
   }
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
