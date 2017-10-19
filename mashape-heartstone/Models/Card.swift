//
//  Card.swift
//  mashape-heartstone
//
//  Created by Cristian Palomino Rivera on 12/10/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Card: Mapper {
    
    public var cardId: String!
    public var dbfId: String!
    public var name: String!
    public var cardSet: String!
    public var type: String!
    public var faction: String!
    public var rarity: String!
    public var cost: Int!
    public var attack: Int!
    public var health: Int!
    public var text: String!
    public var flavor: String!
    public var artist: String!
    public var collectible: Bool!
    public var elite: Bool!
    public var playerClass: String!
    public var img: String!
    public var imgGold: String?
    public var locale: String?
    public var mechanics: [Any] = []
    
    init?(json: JSON) {
        
        guard
            let cardId = json["cardId"].string,
            let dbfId = json["dbfId"].string,
            let name = json["name"].string,
            let cardSet = json["cardSet"].string,
            let type = json["type"].string,
            let faction = json["faction"].string,
            let rarity = json["rarity"].string,
            let cost = json["cost"].int,
            let attack = json["attack"].int,
            let health = json["health"].int,
            let text = json["text"].string,
            let flavor = json["flavor"].string,
            let artist = json["artist"].string,
            let collectible = json["collectible"].bool,
            let elite = json["elite"].bool,
            let playerClass = json["playerClass"].string,
            let img = json["img"].string,
            let imgGold = json["imgGold"].string,
            let locale = json["locale"].string,
            let mechanics = json["mechanics"].array
            else { return }
        
        self.cardId = cardId
        self.dbfId = dbfId
        self.name = name
        self.cardSet = cardSet
        self.type = type
        self.faction = faction
        self.rarity = rarity
        self.cost = cost
        self.attack = attack
        self.health = health
        self.text = text
        self.flavor = flavor
        self.artist = artist
        self.collectible = collectible
        self.elite = elite
        self.playerClass = playerClass
        self.img = img
        self.imgGold = imgGold
        self.locale = locale
        self.mechanics = mechanics
        
    }
}
