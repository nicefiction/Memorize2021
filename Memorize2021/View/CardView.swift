// CardView.swift

// MARK: - LIBRARIES -

import SwiftUI



struct CardView: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @State private var isFaceUp: Bool = true
   
   
   
   // MARK: - PROPERTIES
   
   let roundedRectangle: RoundedRectangle = RoundedRectangle(cornerRadius: 25.0)
   let content: String
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      return ZStack {
         if isFaceUp {
            roundedRectangle
               .foregroundColor(.white)
            roundedRectangle
               ///`strokeBorder` draws te stroke _inside_ the Shape :
               .strokeBorder(lineWidth: 3)
            Text(content)
               .font(.largeTitle)
         } else {
            roundedRectangle
               .fill()
         }
      }
      .onTapGesture {
         isFaceUp.toggle()
      }
   }
}





// MARK: - PREVIEWS -

struct CardView_Previews: PreviewProvider {
   
   static var previews: some View {
      
      CardView(content: "🐰")
         .preferredColorScheme(.dark)
   }
}
