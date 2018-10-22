//
//  MemoryCard.swift
//  proj_2
//
//  Created by Yue on 10/22/18.
//  Copyright © 2018 Yue. All rights reserved.
//

import Foundation

struct MemoryCard {
    
    // MARK: - Nested types
    
//    struct Rank {
//        static let rook = 0
//        static let min = 1
//        static let max = 14
//    }
    
    enum Suit : String {
        case onion1, onion2, onion3, pineapple, tomato, carrot, cabbage
        
//        var description: String {
//            return self.rawValue.uppercased()
//        }
        
        static let validSuits: [Suit] = [.onion1, .onion2, .onion3, .pineapple, .tomato, .carrot, .cabbage]
    }
    
    // MARK: - Properties
    
    var isFaceUp = false
//    var rank = Rank.rook
    var suit = Suit.onion1
    
    // MARK: - Initialization
    
    init() {
        // By default this builds a Rook card
    }
    
    init(suit: Suit) {
        self.suit = suit
//        self.rank = rank
    }
}
