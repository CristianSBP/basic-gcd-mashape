//
//  InfoViewModelLocalesItem.swift
//  mashape-heartstone
//
//  Created by Cristian Palomino Rivera on 21/10/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation

class InfoViewModelLocalesItem: InfoViewModelItem {
    
    var infoCellType: InfoCellType {
        return .locales
    }
    
    var sectionTitle: String {
        return "Locales"
    }
    
    var rowCount: Int {
        return locales.count
    }
    
    public var locales: [String]
    
    init(locales: [String]) {
        self.locales = locales
    }
}
