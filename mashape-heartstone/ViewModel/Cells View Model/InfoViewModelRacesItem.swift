//
//  InfoViewModelRacesItem.swift
//  mashape-heartstone
//
//  Created by Cristian Palomino Rivera on 21/10/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation

class InfoViewModelRacesItem: InfoViewModelItem {
    
    var infoCellType: InfoCellType {
        return .races
    }
    
    var sectionTitle: String {
        return "Races"
    }
    
    var rowCount: Int {
        return races.count
    }
    
    public var races: [String]
    
    init(races: [String]) {
        self.races = races
    }
}
