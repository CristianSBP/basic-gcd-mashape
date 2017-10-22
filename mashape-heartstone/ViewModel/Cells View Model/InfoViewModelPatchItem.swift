//
//  InfoViewModelPatchItem.swift
//  mashape-heartstone
//
//  Created by Cristian Palomino Rivera on 21/10/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation

class InfoViewModelPatchItem: InfoViewModelItem {
    
    var infoCellType: InfoCellType {
        return .patch
    }
    
    var sectionTitle: String {
        return "Patch"
    }
    
    var rowCount: Int {
        return 1
    }
    
    public var patch: String
    
    init(patch: String) {
        self.patch = patch
    }
}
