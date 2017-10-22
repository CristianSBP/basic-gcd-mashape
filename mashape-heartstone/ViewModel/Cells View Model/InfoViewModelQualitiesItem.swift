//
//  InfoViewModelQualitiesItem.swift
//  mashape-heartstone
//
//  Created by Cristian Palomino Rivera on 21/10/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation
import UIKit

class InfoViewModelQualitiesItem: NSObject, InfoViewModelItem {
    
    var infoCellType: InfoCellType {
        return .qualities
    }
        
    var sectionTitle: String {
        return "Qualities"
    }
    
    var rowCount: Int {
        return 1
    }
    
    public var qualities: [String]
    
    init(qualities: [String]) {
        self.qualities = qualities
    }
}

extension InfoViewModelQualitiesItem: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return qualities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = qualities[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QualityCollectionViewCell.identifier, for: indexPath) as? QualityCollectionViewCell
        cell?.item = item
        return cell!
    }
}
