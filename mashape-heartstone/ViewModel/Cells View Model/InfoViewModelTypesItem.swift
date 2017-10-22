//
//  InfoViewModelTypesItem.swift
//  mashape-heartstone
//
//  Created by Cristian Palomino Rivera on 21/10/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation

class InfoViewModelTypesItem: InfoViewModelItem {
    
    var infoCellType: InfoCellType {
        return .types
    }
    
    var sectionTitle: String {
        return "Types"
    }
    
    var rowCount: Int {
        return types.count
    }
    
    public var types: [String]
    
    init(types: [String]) {
        self.types = types
    }
}
