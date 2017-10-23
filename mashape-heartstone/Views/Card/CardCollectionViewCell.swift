//
//  CardCollectionViewCell.swift
//  mashape-heartstone
//
//  Created by Cristian Palomino Rivera on 22/10/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class CardCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cardImage: UIImageView!
    
    public var item: CardViewModelItem? {
        didSet {
            guard let item = item else { return }
            print(item.card.img)
            if let url = item.card.img, let imgURL = URL(string: url) {
                cardImage.af_setImage(withURL: imgURL, imageTransition: .crossDissolve(0.2))
            }
        }
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
   
    override func prepareForReuse() {
        super.prepareForReuse()
        cardImage.af_cancelImageRequest()
        cardImage.layer.removeAllAnimations()
        cardImage.image = nil
    }
}
