//
//  PatchTableViewCell.swift
//  mashape-heartstone
//
//  Created by Cristian Palomino Rivera on 18/10/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PatchTableViewCell: UITableViewCell {

    @IBOutlet weak var patchLabel: UILabel?

    var item: InfoViewModelItem? {
        didSet {
            guard let item = item as? InfoViewModelPatchItem else { return }
            patchLabel?.text = item.patch
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
