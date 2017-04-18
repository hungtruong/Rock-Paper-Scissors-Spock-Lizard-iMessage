//
//  RPSSLSelectionViewController.swift
//  Rock Paper Scissors Spock Lizard
//
//  Created by Hung Truong on 4/10/17.
//  Copyright © 2017 Hung Truong. All rights reserved.
//

import UIKit

private let reuseIdentifier = "RPSSLMoveCell"

class RPSSLSelectionViewController: UICollectionViewController {
    
    var moves : [Move] = [.rock, .paper, .scissors, .spock, .lizard]
    weak var delegate : MoveSelectionDelegate?

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moves.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
        if let cell = cell as? RPSSLCollectionViewCell {
            let move = moves[indexPath.row]
            cell.moveLabel.text = move.rawValue.capitalized
            cell.imageView.image = UIImage.init(named: move.rawValue)
        }
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let move = moves[indexPath.row]
        self.delegate?.playerDidSelect(move: move)
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        return collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
    }
    
}

class RPSSLCollectionViewCell : UICollectionViewCell {
    @IBOutlet weak var imageView : UIImageView!
    @IBOutlet weak var moveLabel : UILabel!
}

enum Move : String{
    case rock
    case paper
    case scissors
    case spock
    case lizard
}

protocol MoveSelectionDelegate: class {
    /// Called when a player selects a move, e.g. rock or spock
    func playerDidSelect(move: Move)
}
