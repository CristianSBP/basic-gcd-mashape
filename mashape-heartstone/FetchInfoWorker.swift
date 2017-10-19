//
//  FetchInfoWorker.swift
//  mashape-heartstone
//
//  Created by Cristian Palomino Rivera on 8/10/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation
import SwiftyJSON

class FetchInfoWorker {
    
    public weak var delegate: FetchInfoWorkerDelegate?
    
    private let queueFetch: DispatchQueue = DispatchQueue(label: "com.fetch.info", qos: .background, attributes: .concurrent)
    private let semaphore: DispatchSemaphore = DispatchSemaphore(value: 0)
    private let dispatchGroup: DispatchGroup = DispatchGroup()
    
    private let mashapeApi: MashapeApi = MashapeApi()
    
    private var info: [String: [String]] = [:] {
        didSet {
            sectionsInfo = Array(info.keys)
            
            classes = info["classes"]!
            factions = info["factions"]!
            qualities = info["qualities"]!
            races = info["races"]!
            types = info["types"]!
        }
    }
    
    private var classes: [String] = []
    private var factions: [String] = []
    private var qualities: [String] = []
    private var races: [String] = []
    private var types: [String] = []
    
    private var cardsByClasses: [String: [[String: Any]]] = [:]
    
    public internal(set) var sectionsInfo: [String] = []

    public func itemsFor(section: String) -> [String] {
        return info[section]!
    }
    
    public func cardsBy(name: String) -> [[String: Any]] {
        return cardsByClasses[name] ?? []
    }
    
    init() {
        print(Date())
        
        fetchInfo()
        classes.forEach { _class in
            self.fetchCardsByClass(withName: _class)
        }
        
        dispatchGroup.notify(queue: .global()) {
            print("=================================")
            print("Count Info Fetched -> \(self.info.count)" )
            
            print("\tCount Classes Fetched -> \(self.classes.count)" )
            self.classes.forEach{ _class in print("\t\tCount of \(_class) -> \(self.cardsByClasses[_class]!.count)" ) }
            
            print("\tCount Factions Fetched -> \(self.factions.count)" )
            print("\tCount Qualities Fetched -> \(self.qualities.count)" )
            print("\tCount Races Fetched -> \(self.races.count)" )
            print("\tCount Types Fetched -> \(self.types.count)" )
            
            print("=================================")
            print(Date())
            
            self.delegate?.fetchedDone()
        }
    }
    
    private func fetchInfo() {
        print("=================================")
        print("Start Fetch Info")
        dispatchGroup.enter()

        let _url = URL(string: "\(mashapeApi.baseURL)/info")!
        mashapeApi.session.JSONTask(with: _url, queue: queueFetch) { result in
            switch result {
            case .success(let json):
                guard var dic = json as? [String: Any] else { return }
                dic["patch"] = [dic["patch"]]
                self.info = dic as! [String: [String]]
            case .failed(let message):
                print("\(message) -> Fetch Info")
            }
            
            print("Done Fetch Info")
            self.semaphore.signal()
            self.dispatchGroup.leave()
        }

        _ = semaphore.wait(timeout: .distantFuture)
    }
    
    private func fetchCardsByClass(withName name: String) {
        print("=================================")
        print("Start Fetch Cards by Class with Name -> \(name)")
        dispatchGroup.enter()
        
        let _name = name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let _url = URL(string: "\(mashapeApi.baseURL)/cards/classes/\(_name)")!
        mashapeApi.session.JSONTask(with: _url, queue: queueFetch) { result in
            switch result {
            case .success(let json):
                guard let dicArray = json as? [[String: Any]] else { return }
                self.cardsByClasses[name] = dicArray
            case .failed(let message):
                print("\(message) -> Fetch Cards by Class with Name -> \(name)")
            }
            
            print("Done Fetch Cards by Class with Name -> \(name)")
            self.dispatchGroup.leave()
        }
    }
}

protocol FetchInfoWorkerDelegate: class {
    
    func fetchedDone()
}
