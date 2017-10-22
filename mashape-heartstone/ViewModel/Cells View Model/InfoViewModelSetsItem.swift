//
//  InfoViewModelSetsItem.swift
//  mashape-heartstone
//
//  Created by Cristian Palomino Rivera on 21/10/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation

class InfoViewModelSetsItem: InfoViewModelItem {
    
    var infoCellType: InfoCellType {
        return .sets
    }
    
    var sectionTitle: String {
        return "Sets"
    }
    
    var rowCount: Int {
        return sets.count
    }
    
    public var sets: [String]
    
    init(sets: [String]) {
        self.sets = sets
    }
}
