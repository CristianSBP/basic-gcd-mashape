//
//  InfoViewModelClassesItem.swift
//  mashape-heartstone
//
//  Created by Cristian Palomino Rivera on 21/10/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation

class InfoViewModelClassesItem: InfoViewModelItem {
    
    var infoCellType: InfoCellType {
        return .classes
    }
    
    var sectionTitle: String {
        return "Classes"
    }
    
    var rowCount: Int {
        return classes.count
    }
    
    public var classes: [String]
    
    init(classes: [String]) {
        self.classes = classes
    }
}
