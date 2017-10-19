//
//  SetsTableViewCell.swift
//  mashape-heartstone
//
//  Created by Cristian Palomino Rivera on 19/10/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class SetsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var setLabel: UILabel?
    
    var item: String? {
        didSet {
            guard let item = item else { return }
            setLabel?.text = item
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
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
