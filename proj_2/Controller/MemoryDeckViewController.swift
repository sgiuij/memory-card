//
//  MemoryDeckViewController.swift
//  proj_2
//
//  Created by Yue on 10/22/18.
//  Copyright © 2018 Yue. All rights reserved.
//

import UIKit

class memoryDeckViewController : UIViewController {
    
    // MARK: - Constants
    
    private struct Storyboard {
        static let memoryCardCellIdentifier = "memoryCardCell"
    }
    
    // MARK: - Properties
    
    private var deck = MemoryDeck()
    
    // MARK: - Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewBottomConstraint: NSLayoutConstraint!
    
    // MARK: - Actions
    
//    @IBAction func showAllCards(_ sender: UIBarButtonItem) {
//        setCardsFaceUp(true)
//        collectionView.reloadData()
//    }
    
    @IBAction func shuffle(_ sender: UIBarButtonItem) {
        deck.shuffle()
        setCardsFaceUp(false)
        collectionView.reloadData()
    }
    
//    @IBAction func toggleSize(_ sender: Any) {
//        collectionView.layoutIfNeeded()
//
//        if collectionViewBottomConstraint.constant > 0 {
//            collectionViewBottomConstraint.constant = 0
//        } else {
//            collectionViewBottomConstraint.constant = collectionView.bounds.height / 2
//        }
//
//        UIView.animate(withDuration: Animation.Duration,
//                       delay: 0,
//                       options: [.curveEaseInOut],
//                       animations: {
//                        self.view.layoutIfNeeded()
//        })
//    }
//
    // MARK: - Helpers
    
    private func flipCard(inCell memoryCardCell: MemoryCardCell, at indexPath: IndexPath) {
        UIView.transition(with: memoryCardCell.memoryCardView,
                          duration: CAAnimation.Duration,
                          options: .transitionFlipFromLeft,
                          animations: {
                            memoryCardCell.memoryCardView.isFaceUp.toggle()
                            memoryCardCell.memoryCardView.setNeedsDisplay()
        },
                          completion: {
                            _ in
                            self.deck.remove(at: indexPath.row)
                            self.collectionView.deleteItems(at: [indexPath])
        })
    }
    
    private func setCardsFaceUp(_ isFaceUp: Bool) {
        for i in 0 ..< deck.count {
            deck[i].isFaceUp = isFaceUp
        }
    }
}

// MARK: - Collection view data source

extension memoryDeckViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.memoryCardCellIdentifier,
                                                      for: indexPath)
        
        if let memoryCardCell = cell as? MemoryCardCell {
            memoryCardCell.memoryCardView.card = deck[indexPath.row]
            memoryCardCell.memoryCardView.setNeedsDisplay()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return deck.count
    }
}

// MARK: - Collection view delegate

extension memoryDeckViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let memoryCardCell = collectionView.cellForItem(at: indexPath) as? MemoryCardCell {
            deck[indexPath.row].isFaceUp.toggle()
            flipCard(inCell: memoryCardCell, at: indexPath)
        }
    }
}
