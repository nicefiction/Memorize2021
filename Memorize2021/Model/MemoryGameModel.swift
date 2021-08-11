// MemoryGameModel.swift

// MARK: - LIBRARIES -

import Foundation



struct MemoryGameModel<CardContent> {
   
   // MARK: - NESTED TYPES
   
   struct Card {
      
      var isFaceUp: Bool = false
      var isMatched: Bool = false
      var content: CardContent
   }
   
   
   
   // MARK: - PROPERTIES
   
   private(set) var cards: Array<MemoryGameModel.Card>
   
   
   
   // MARK: - INITIALIZER METHODS
   
   init(numberOfPairsOfCards: Int,
        createCardContent: (Int) -> CardContent) {
      
      self.cards = Array<MemoryGameModel.Card>()
      
      
      for pairIndex in 0..<numberOfPairsOfCards {
         
         let content: CardContent = createCardContent(pairIndex)
         
         cards.append(MemoryGameModel.Card(content: content))
         cards.append(MemoryGameModel.Card(content: content))
      }
   }
   
   
   
   // MARK: - METHODS
   
   func choose(_ card: MemoryGameModel.Card) {}
   
   
}
