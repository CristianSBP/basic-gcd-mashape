//
//  Info.swift
//  mashape-heartstone
//
//  Created by Cristian Palomino Rivera on 12/10/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Info: Mapper {
    
    public var patch: String!
    public var classes: [String] = []
    public var sets: [String] = []
    public var types: [String] = []
    public var factions: [String] = []
    public var qualities: [String] = []
    public var races: [String] = []
    public var locales: [String] = []
    
    init?(json: JSON) {
        
        guard
            let patch = json["patch"].string,
            let classes = json["classes"].array,
            let sets = json["sets"].array,
            let types = json["types"].array,
            let factions = json["factions"].array,
            let qualities = json["qualities"].array,
            let races = json["races"].array,
            let locales = json["locales"].array
            else { return }
        
        self.patch = patch
        self.classes = classes.map(String.init)
        self.sets = sets.map(String.init)
        self.types = types.map(String.init)
        self.factions = factions.map(String.init)
        self.qualities = qualities.map(String.init)
        self.races = races.map(String.init)
        self.locales = locales.map(String.init)
    }
}
