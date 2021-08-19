// MemoryGameModel.swift

// MARK: - LIBRARIES -

import Foundation



struct MemoryGameModel<CardContent>
where CardContent: Comparable {
   
   // MARK: - NESTED TYPES
   
   struct Card: Identifiable {
      
      let content: CardContent
      let id: Int
      var isFaceUp: Bool = true
      var isMatched: Bool = false
   }
   
   
   
   // MARK: - PROPERTIES
   
   private(set) var cards: Array<MemoryGameModel.Card>
   
   
   private var chosenFirstCardIndex: Int? {
      get {
         // ORIGINAL CODE :
//         var chosenCardIndices = Array<Int>()
//         for cardIndex in cards.indices {
//            if cards[cardIndex].isFaceUp == true {
//               chosenCardIndices.append(cardIndex)
//            }
//         }
//         return chosenCardIndices.count == 1 ? chosenCardIndices.first : nil
         
         // FIRST REFACTOR :
//         let chosenCardIndices: Array<Int> = cards.indices.filter({ (cardIndex: Int) in
//            return cards[cardIndex].isFaceUp
//         })
//         return chosenCardIndices.oneAndOnly
         
         // SECOND REFACTOR :
         return cards.indices.filter({ cards[$0].isFaceUp }).oneAndOnly
      }
      
      // ORIGINAL CODE :
//      set {
//         for cardIndex in cards.indices {
//            /// Flip over all the cards :
//            if cardIndex != newValue {
//               cards[cardIndex].isFaceUp = false
//            } else {
//               cards[cardIndex].isFaceUp = true
//            }
//         }
//      }
      // FIRST REFACTOR :
//      set {
//         cards.indices.forEach({ (cardIndex: Int) in
//            cards[cardIndex].isFaceUp = (cardIndex == newValue)
//         })
//      }
      // SECOND REFACTOR :
      set { cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) } }
   }
   
   
   
   // MARK: - INITIALIZER METHODS
   
   init(numberOfPairsOfCards: Int,
        createCardContent: (Int) -> CardContent) {
      
      self.cards = Array<MemoryGameModel.Card>()
      
      
      for pairIndex in 0..<numberOfPairsOfCards {
         
         let content: CardContent = createCardContent(pairIndex)
         
         cards.append(MemoryGameModel.Card(content: content,
                                           id: pairIndex * 2))
         cards.append(MemoryGameModel.Card(content: content,
                                           id: pairIndex * 2 + 1))
      }
   }
   
   
   
   // MARK: - METHODS
   
   mutating func choose(_ card: MemoryGameModel.Card) {
      
      if let _chosenSecondCardIndex = cards.firstIndex(where: { return $0.id == card.id }),
         /// You cannot click again on a card that is faceup :
         !cards[_chosenSecondCardIndex].isFaceUp,
         /// You cannot click again on cards that have been matched already :
         !cards[_chosenSecondCardIndex].isMatched {
         if let _chosenFirstCardIndex = chosenFirstCardIndex {
            if cards[_chosenFirstCardIndex].content == cards[_chosenSecondCardIndex].content {
               cards[_chosenFirstCardIndex].isMatched = true
               cards[_chosenSecondCardIndex].isMatched = true
            }
            cards[_chosenSecondCardIndex].isFaceUp = true
         } else {
            chosenFirstCardIndex = _chosenSecondCardIndex
         }
      }
   }
}





// MARK: - EXTENSIONS -

extension Array {
   
   var oneAndOnly: Element? {
      
      return self.count == 1 ? self.first : nil
   }
}
