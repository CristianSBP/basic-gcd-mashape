//
//  Result.swift
//  mashape-heartstone
//
//  Created by Cristian Palomino Rivera on 7/10/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation

public enum Result<T> {
    
    case success(T)
    case failed(String)
}
