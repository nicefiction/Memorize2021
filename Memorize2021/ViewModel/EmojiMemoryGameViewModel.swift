// EmojiMemoryGameViewModel.swift

// MARK: - LIBRARIES -
/// The `EmojiMemoryGameViewModel` is part of the UI
/// so it can actually import SwiftUI .
import SwiftUI



class EmojiMemoryGameViewModel: ObservableObject {
   
   // MARK: - TYPE PROPERTIES
   
   static let emojis: Array<String> = [
      "🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "🐔", "🐧", "🐦", "🐤", "🦄"
   ]
   
   
   
   // MARK: - TYPE METHODS
   
   static func createMemoryGameModel()
   -> MemoryGameModel<String> {
      
      return MemoryGameModel(numberOfPairsOfCards: 3) { (pairIndex: Int) -> String in
         return EmojiMemoryGameViewModel.emojis[pairIndex]
      }
   }
   
   
   
   // MARK: - PROPERTIES
   
   /// Our ViewModel's job is to be an intermediary between a Model and a View .
   /// So it needs to have a connection between the View and the Model .
   /// And in fact , our ViewModel is going to create its own Model .
   /// That is not always the case for a ViewModel ,
   /// again , sometimes the Model is a network data base that already exists
   /// and is just going to connect to it .
   /// But many times it creates the Model that it provides the window on
   /// and it is the ViewModel's job to make either that thing persist
   /// — on disc or the network something —
   /// or it is the kind of thing that the game goes away when the ViewModel goes away
   /// — which is going to be the case for our EmojiMemoryGame .
   /// While you are playing , it is there , but while the ViewModel goes away ,
   /// then the game is over . It is gone .
   /// Because a lot of ViewModels create their own Model .
   /// a lot of times we will say that the ViewModels are _the Truth_ in our app .
   /// If you remember , in MVVM , we said that the Model is the source of Truth . And it is .
   /// But the ViewModel , if it is creating its own Model , it is essentially the ViewModel itself is the Truth :
   /// It stores that truth in the Model . But if you hear people say , oh , I am creating the ViewModel ,
   /// it is the source of truth for mu UI , that is not an unreasonable way to look at it as well .
   
   // private(set) var memoryGameModel: MemoryGameModel<String>
   @Published private var memoryGameModel: MemoryGameModel<String> = EmojiMemoryGameViewModel.createMemoryGameModel()
      
   
   /// The ViewModel's role is to be the gatekeeper to the Model .
   /// What do we mean by that ?
   /// It is the ViewModel's job to protect the Model against ill behaving views
   /// or anyone else really , who has access to the ViewModel .
   /// And one way we do that , is , by making the Model `private` .
   /// `private` means
   /// that only the ViewModel's code itself can see the Model .
   /// That protects the Model against any View reaching in and trying to change things .
   /// The basic idea is that we want to make our var and func to be private
   /// unless for sure we want to allow other structs and classes to access them .
   /// Sometimes though , fully `private` is too restrictive though .
   /// For instance , in our memory game ,
   /// people really do need to see those cards ,
   /// otherwise how are our views going to draw the cards if they can't see them ?
   /// So , there is another `private` call — `private(set)` .
   /// `private(set)` tells Swift that other classes and structs can _look_ at the Model ,
   /// but they cannot change it . So , they can't for example call the `choose()` method inside the `MemoryGameModel`
   /// because that would change the memoryGameModel . Which makes sense . We do not want to allow that .
   /// If you want to make it fully `private` , then  it could make the cards available in another way ,
   /// by having its own `cards` var :
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var cards: Array<MemoryGameModel<String>.Card> {
      
      return memoryGameModel.cards
   }
   
   /// So you keep the entire Model private
   /// `private var memoryGameModel: MemoryGameModel<String>`
   /// except for the things that you make public ,
   /// `var cards: Array<MemoryGameModel<String>.Card> {...}`
   
   
   
   // MARK: - METHODS
   
   // User Intent :
   func choose(_ card: MemoryGameModel<String>.Card) {
      
      memoryGameModel.choose(card)
   }
}
