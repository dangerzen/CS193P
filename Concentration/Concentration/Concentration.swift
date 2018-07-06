//
//  Concentration.swift
//  Concentration
//
//  Created by dingzier on 2018/7/1.
//  Copyright © 2018 danger. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    
    var indexOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOneAndOnlyFaceUpCard = nil
        } else {
            // either no cars or 2 cards are face up
            for flipDownIndex in cards.indices{
                cards[flipDownIndex].isFaceUp = true
            }
            cards[index].isFaceUp = true
            indexOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        // TODO: Shuffle the cards
    }
}
