//
//  CardsViewModel.swift
//  mashape-heartstone
//
//  Created by Cristian Palomino Rivera on 22/10/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation
import UIKit

class CardsViewModel: NSObject {
    
    private var items: [CardViewModelItem] = []
    
    public weak var delegate: CardsViewModelDelegate?
    
    var className: String
    
    init(className: String) {
        self.className = className
    }
    
    func getCards() {
        Card().perClass(className) { (result) in
            switch result {
            case .success(let cards):
                self.items = cards.map(CardViewModelItem.init)
            case .failed(let message):
                print(message)
            }
            self.delegate?.cardsFetched()
        }
    }
}

extension CardsViewModel: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.identifier, for: indexPath) as? CardCollectionViewCell
        cell?.item = item
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width * 0.3, height: UIScreen.main.bounds.height * 0.3)
    }
}

protocol CardsViewModelDelegate: class {

    func cardsFetched()
}
