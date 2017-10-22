//
//  QualitiesTableViewCell.swift
//  mashape-heartstone
//
//  Created by Cristian Palomino Rivera on 19/10/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class QualitiesTableViewCell: UITableViewCell {

    @IBOutlet weak var qualitiesCollectionView: UICollectionView?
    
    var item: InfoViewModelItem? {
        didSet {
            guard let item = item as? InfoViewModelQualitiesItem else { return }
            qualitiesCollectionView?.dataSource = item
        }
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        qualitiesCollectionView?.register(QualityCollectionViewCell.nib, forCellWithReuseIdentifier: QualityCollectionViewCell.identifier)
    }
}
