//
//  InfoViewModel.swift
//  mashape-heartstone
//
//  Created by Cristian Palomino Rivera on 12/10/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit
import Foundation

enum InfoCellType {
    
    case patch
    case classes
    case sets
    case types
    case factions
    case qualities
    case races
    case locales
}

protocol InfoViewModelItem {
    
    var infoCellType: InfoCellType { get }
    var rowCount: Int { get }
    var sectionTitle: String { get }
}

protocol InfoViewModelDelegate: class {
    
    func infoFetched()
    func itemSelected()
}

class InfoViewModel: NSObject {
    
    weak var delegate: InfoViewModelDelegate?
    public var items: [InfoViewModelItem] = []
    
    public func fetchInfo() {
        
        MashapeApi().fetchInfo { info in
            guard let info = info else { return }
            self.items.append(InfoViewModelQualitiesItem(qualities: info.qualities))
            self.items.append(InfoViewModelClassesItem(classes: info.classes))
            self.items.append(InfoViewModelSetsItem(sets: info.sets))
            self.items.append(InfoViewModelTypesItem(types: info.types))
            self.items.append(InfoViewModelFactionsItem(factions: info.factions))
            self.items.append(InfoViewModelRacesItem(races: info.races))
            self.items.append(InfoViewModelLocalesItem(locales: info.locales))
            self.items.append(InfoViewModelPatchItem(patch: info.patch))
            self.delegate?.infoFetched()
        }
    }
}

extension InfoViewModel: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].rowCount
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return items[section].sectionTitle
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.section]
        switch item.infoCellType {
        case .patch:
            let cell = tableView.dequeueReusableCell(withIdentifier: PatchTableViewCell.identifier, for: indexPath) as? PatchTableViewCell
            cell?.item = item
            return cell!
        case .classes:
            let cell = tableView.dequeueReusableCell(withIdentifier: ClassesTableViewCell.identifier, for: indexPath) as? ClassesTableViewCell
            let item = item as? InfoViewModelClassesItem
            cell?.item = item?.classes[indexPath.row]
            return cell!
        case .sets:
            let cell = tableView.dequeueReusableCell(withIdentifier: SetsTableViewCell.identifier, for: indexPath) as? SetsTableViewCell
            let item = item as? InfoViewModelSetsItem
            cell?.item = item?.sets[indexPath.row]
            return cell!
        case .types:
            let cell = tableView.dequeueReusableCell(withIdentifier: TypesTableViewCell.identifier, for: indexPath) as? TypesTableViewCell
            let item = item as? InfoViewModelTypesItem
            cell?.item = item?.types[indexPath.row]
            return cell!
        case .factions:
            let cell = tableView.dequeueReusableCell(withIdentifier: FactionsTableViewCell.identifier, for: indexPath) as? FactionsTableViewCell
            let item = item as? InfoViewModelFactionsItem
            cell?.item = item?.factions[indexPath.row]
            return cell!
        case .qualities:
            let cell = tableView.dequeueReusableCell(withIdentifier: QualitiesTableViewCell.identifier, for: indexPath) as? QualitiesTableViewCell
            cell?.item = item
            return cell!
        case .races:
            let cell = tableView.dequeueReusableCell(withIdentifier: RacesTableViewCell.identifier, for: indexPath) as? RacesTableViewCell
            let item = item as? InfoViewModelRacesItem
            cell?.item = item?.races[indexPath.row]
            return cell!
        case .locales:
            let cell = tableView.dequeueReusableCell(withIdentifier: LocalesTableViewCell.identifier, for: indexPath) as? LocalesTableViewCell
            let item = item as? InfoViewModelLocalesItem
            cell?.item = item?.locales[indexPath.row]
            return cell!
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.itemSelected()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = items[indexPath.section]
        switch item.infoCellType {
        case .qualities:
            return 130.0
        default:
            return 65.0
        }
    }
}


