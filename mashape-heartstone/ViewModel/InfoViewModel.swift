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
}

class InfoViewModel: NSObject {
    
    weak var delegate: InfoViewModelDelegate?
    public var items: [InfoViewModelItem] = []
    
    public func fetchInfo() {
        
        MashapeApi().fetchInfo { info in
            guard let info = info else { return }
            self.items.append(InfoViewModelPatchItem(patch: info.patch))
            self.items.append(InfoViewModelClassesItem(classes: info.classes))
            self.items.append(InfoViewModelSetsItem(sets: info.sets))
            self.items.append(InfoViewModelTypesItem(types: info.types))
            self.items.append(InfoViewModelFactionsItem(factions: info.factions))
            self.items.append(InfoViewModelQualitiesItem(qualities: info.qualities))
            self.items.append(InfoViewModelRacesItem(races: info.races))
            self.items.append(InfoViewModelLocalesItem(locales: info.locales))
            self.delegate?.infoFetched()
        }
    }
}

extension InfoViewModel: UITableViewDataSource {
    
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
            let item = item as? InfoViewModelQualitiesItem
            cell?.item = item?.qualities[indexPath.row]
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
}

class InfoViewModelPatchItem: InfoViewModelItem {
    
    var infoCellType: InfoCellType {
        return .patch
    }
    
    var sectionTitle: String {
        return "Patch"
    }
    
    var rowCount: Int {
        return 1
    }
    
    public var patch: String
    
    init(patch: String) {
        self.patch = patch
    }
}

class InfoViewModelClassesItem: InfoViewModelItem {

    var infoCellType: InfoCellType {
        return .classes
    }
    
    var sectionTitle: String {
        return "Classes"
    }
    
    var rowCount: Int {
        return classes.count
    }
    
    public var classes: [String]
    
    init(classes: [String]) {
        self.classes = classes
    }
}

class InfoViewModelSetsItem: InfoViewModelItem {
    
    var infoCellType: InfoCellType {
        return .sets
    }
    
    var sectionTitle: String {
        return "Sets"
    }
    
    var rowCount: Int {
        return sets.count
    }
    
    public var sets: [String]
    
    init(sets: [String]) {
        self.sets = sets
    }
}

class InfoViewModelTypesItem: InfoViewModelItem {
    
    var infoCellType: InfoCellType {
        return .types
    }
    
    var sectionTitle: String {
        return "Types"
    }
    
    var rowCount: Int {
        return types.count
    }

    public var types: [String]
    
    init(types: [String]) {
        self.types = types
    }
}

class InfoViewModelFactionsItem: InfoViewModelItem {
    
    var infoCellType: InfoCellType {
        return .factions
    }
    
    var sectionTitle: String {
        return "Factions"
    }
    
    var rowCount: Int {
        return factions.count
    }
    
    public var factions: [String]
    
    init(factions: [String]) {
        self.factions = factions
    }
}

class InfoViewModelQualitiesItem: InfoViewModelItem {
    
    var infoCellType: InfoCellType {
        return .qualities
    }
    
    var sectionTitle: String {
        return "Qualities"
    }
    
    var rowCount: Int {
        return qualities.count
    }
    
    public var qualities: [String]
    
    init(qualities: [String]) {
        self.qualities = qualities
    }
}

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

class InfoViewModelLocalesItem: InfoViewModelItem {
    
    var infoCellType: InfoCellType {
        return .locales
    }
    
    var sectionTitle: String {
        return "Locales"
    }
    
    var rowCount: Int {
        return locales.count
    }
    
    public var locales: [String]
    
    init(locales: [String]) {
        self.locales = locales
    }
}
