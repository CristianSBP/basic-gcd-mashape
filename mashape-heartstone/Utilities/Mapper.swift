//
//  Mapper.swift
//  mashape-heartstone
//
//  Created by Cristian Palomino Rivera on 12/10/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol Mapper {

    init?(json: JSON)
}
