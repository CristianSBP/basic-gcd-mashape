//
//  InfoViewModelFactionsItem.swift
//  mashape-heartstone
//
//  Created by Cristian Palomino Rivera on 21/10/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation

class InfoViewModelFactionsItem: InfoViewModelItem {
    
    var infoCellType: InfoCellType {
        return .factions
    }
    
    var sectionTitle: String {
        return "Factions"
    }
    
    var rowCount: Int {
        return factions.count
    }
    
    public var factions: [String]
    
    init(factions: [String]) {
        self.factions = factions
    }
}
