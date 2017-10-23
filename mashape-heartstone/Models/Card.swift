//
//  Card.swift
//  mashape-heartstone
//
//  Created by Cristian Palomino Rivera on 12/10/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation
import SwiftyJSON

class Card: Mapper {
    
    public var cardId: String?
    public var dbfId: String?
    public var name: String?
    public var cardSet: String?
    public var type: String?
    public var faction: String?
    public var rarity: String?
    public var cost: Int?
    public var attack: Int?
    public var health: Int?
    public var text: String?
    public var flavor: String?
    public var artist: String?
    public var collectible: Bool?
    public var elite: Bool?
    public var playerClass: String?
    public var img: String?
    public var imgGold: String?
    public var locale: String?
    public var mechanics: [Any] = []
    
    init() { }
    
    required init?(json: JSON) {

        self.cardId = json["cardId"].string
        self.dbfId = json["dbfId"].string
        self.name = json["name"].string
        self.cardSet = json["cardSet"].string
        self.type = json["type"].string
        self.faction = json["faction"].string
        self.rarity = json["rarity"].string
        self.cost = json["cost"].int
        self.attack = json["attack"].int
        self.health = json["health"].int
        self.text = json["text"].string
        self.flavor = json["flavor"].string
        self.artist = json["artist"].string
        self.collectible = json["collectible"].bool
        self.elite = json["elite"].bool
        self.playerClass = json["playerClass"].string
        self.img = json["img"].string
        self.imgGold = json["imgGold"].string
        self.locale = json["locale"].string
        self.mechanics = json["mechanics"].array ?? []
    }
    
    public func perClass(_ className: String, completion: @escaping ((Result<[Card]>) -> Void)) {
        let formatClassName = className.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = URL(string: "\(MashapeApi.baseURL)/cards/classes/\(formatClassName)")!
        MashapeApi().session.JSONTask(with: url) { result in
            switch result {
            case .success(let json):
                let jsonArray = JSON(json).arrayValue
                let cards = jsonArray.flatMap(Card.init)
                completion(.success(cards))
            case .failed(let message):
                completion(.failed(message))
            }
        }
    }
}
