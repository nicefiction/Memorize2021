// ContentView.swift

// MARK: - LIBRARIES -

import SwiftUI


struct ContentView: View {
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      return ZStack {
         RoundedRectangle(cornerRadius: 25.0)
            .stroke(lineWidth: 3)
         Text("Hello World")
      }
      .foregroundColor(.red)
      
   }
}





// MARK: - PREVIEWS -

struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}
