//
//  MemoryDeck.swift
//  proj_2
//
//  Created by Yue on 10/22/18.
//  Copyright © 2018 Yue. All rights reserved.
//

import Foundation

struct MemoryDeck {
    private var cards: [MemoryCard] = []
    
    init() {
        // Here we build a new deck in order of suit and rank.
        for suit in MemoryCard.Suit.validSuits {
            cards.append(MemoryCard(suit: suit))
//
//            if suit == MemoryCard.Suit.rook {
//                cards.append(MemoryCard())
//            } else {
//                for rank in MemoryCard.Rank.min ... MemoryCard.Rank.max {
//                    cards.append(RookCard(suit: suit, rank: rank))
//                }
//            }
        }
    }
    
    subscript(index: Int) -> MemoryCard {
        get {
            return cards[index]
        }
        set {
            cards[index] = newValue
        }
    }
    
    var count: Int {
        return cards.count
    }
    
    mutating func remove(at index: Int) {
        cards.remove(at: index)
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
}
