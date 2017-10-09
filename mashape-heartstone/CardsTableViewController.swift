//
//  CardsTableViewController.swift
//  mashape-heartstone
//
//  Created by Cristian Palomino Rivera on 8/10/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class CardsTableViewController: UITableViewController {

    public var identifier: String! {
        didSet {
            items = Session.shared.infoWorker.cardsBy(name: identifier)
        }
    }
    
    private var items: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Session.shared.infoWorker.delegate = self
        title = identifier
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let label = items[indexPath.row]
        cell.textLabel?.text = label
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
}

extension CardsTableViewController: FetchInfoWorkerDelegate {
    
    func fetchedDone() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
