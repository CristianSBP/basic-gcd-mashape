//
//  CardsCollectionViewController.swift
//  mashape-heartstone
//
//  Created by Cristian Palomino Rivera on 22/10/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class CardsCollectionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    public var cardsViewModel: CardsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        prepare()
    }
    
    private func prepare() {
        cardsViewModel.getCards()
        cardsViewModel.delegate = self
        collectionView.dataSource = cardsViewModel
        collectionView.delegate = cardsViewModel
    }
    
    private func registerCells() {
        collectionView.register(CardCollectionViewCell.nib, forCellWithReuseIdentifier: CardCollectionViewCell.identifier)
    }
}

extension CardsCollectionViewController: CardsViewModelDelegate {
    
    func cardsFetched() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}
