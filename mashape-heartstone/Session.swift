//
//  Session.swift
//  mashape-heartstone
//
//  Created by Cristian Palomino Rivera on 1/10/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation

class Session {

    var infoWorker: FetchInfoWorker!

    static let shared = Session()
    private init() {
        if infoWorker == nil {
            infoWorker = FetchInfoWorker()
        }
    }
}
