// MemoryGameModel.swift

// MARK: - LIBRARIES -

import Foundation



struct MemoryGameModel<CardContent>
where CardContent: Comparable {
   
   // MARK: - NESTED TYPES
   
   struct Card: Identifiable {
      
      let content: CardContent
      let id: Int
      var isFaceUp: Bool = false
      var isMatched: Bool = false
   }
   
   
   
   // MARK: - PROPERTIES
   
   private(set) var cards: Array<MemoryGameModel.Card>
   
   private var chosenFirstCardIndex: Int?
   
   
   
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
      
      print("The choose() method from the MemoryGameModel is executed.")
      
      // LONGFORM notation :
      // if let _chosenCardIndex = cards.firstIndex(where: { (cardInTheCardsArray: MemoryGameModel.Card) in
      //    return cardInTheCardsArray.id == card.id
      // }) {
      // SHORTHAND notation :
      if
         let _chosenSecondCardIndex = cards.firstIndex(where: { return $0.id == card.id }),
         /// You cannot click again on a card that is faceup :
         !cards[_chosenSecondCardIndex].isFaceUp,
         /// You cannot click again on cards that have been matched already :
         !cards[_chosenSecondCardIndex].isMatched {
         
         if
            let _chosenFirstCardIndex = chosenFirstCardIndex {
            if cards[_chosenFirstCardIndex].content == cards[_chosenSecondCardIndex].content {
               
               cards[_chosenFirstCardIndex].isMatched = true
               cards[_chosenSecondCardIndex].isMatched = true
            }
            
            chosenFirstCardIndex = nil
         } else {
            /// Flip over all the cards :
            for index in cards.indices {
               cards[index].isFaceUp = false
            }
            chosenFirstCardIndex = _chosenSecondCardIndex
         }
         cards[_chosenSecondCardIndex].isFaceUp.toggle()
         print("Second card: \(cards[_chosenSecondCardIndex])")
      }
      
      print("Cards: \(cards)")
   }
   /*
   mutating func choose(_ card: MemoryGameModel.Card) {
      
      print("Hello from the MemoryGameModel.")
 
      let cardIndex = index(of: card)
      // var chosenCard = cards[cardIndex]
      // chosenCard.isFaceUp.toggle()
      /// `GOTCHA` :
      /// When I say `var chosenCard = cards[cardIndex]`
      /// I make a copy of that card .
      /// Even assigning one variable — `var chosenCard` —
      /// to another — `cards[cardIndex]`,
      /// copies things .
      /// Structs are copied around all over the place .
      /// If you want to change this `cards[cardIndex]`,
      /// You have to change it directly .
      /// We have to say :
      if let _cardIndex = cardIndex {
         cards[_cardIndex].isFaceUp.toggle()
         
         print("Chosen card: \(cards[_cardIndex])")
         print("Cards: \(cards)")
      }
      /// We have to get rid of the `chosenCard` imtermediary
      /// as it was a copy .
   }
    
   
   
   func index(of card: Card)
   -> Int? {
      
      for index in 0..<cards.count {
         if cards[index].id == card.id {
            return index
         }
      }
      return nil
   }
   */
}
