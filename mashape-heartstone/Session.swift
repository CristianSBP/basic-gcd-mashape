//
//  Session.swift
//  mashape-heartstone
//
//  Created by Cristian Palomino Rivera on 1/10/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation

class Session {

    var cards: [String] = [String]()
    var classes: [String] = [String]()
    var cardsCount: Int = 0
    
    static let shared = Session()
    private init() { }
}
