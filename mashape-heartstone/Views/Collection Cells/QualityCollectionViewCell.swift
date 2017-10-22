//
//  QualityCollectionViewCell.swift
//  mashape-heartstone
//
//  Created by Cristian Palomino Rivera on 21/10/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class QualityCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var qualityLabel: UILabel!
    @IBOutlet weak var letterLabel: UILabel!
    @IBOutlet weak var roundedView: UIView!
    
    var item: String? {
        didSet {
            qualityLabel.text = item
            letterLabel.text = item?.first?.description
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
        roundedView.layer.cornerRadius = 25.0
    }
}
