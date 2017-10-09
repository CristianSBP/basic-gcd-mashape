//
//  InfoTableViewController.swift
//  mashape-heartstone
//
//  Created by Cristian Palomino Rivera on 8/10/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class InfoTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return Session.shared.infoWorker.sectionsInfo.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let name = Session.shared.infoWorker.sectionsInfo[section]
        return Session.shared.infoWorker.itemsFor(section: name).count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Session.shared.infoWorker.sectionsInfo[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let name = Session.shared.infoWorker.sectionsInfo[indexPath.section]
        let label = Session.shared.infoWorker.itemsFor(section: name)[indexPath.row]
        cell.textLabel?.text = label
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as? CardsTableViewController
        let name = Session.shared.infoWorker.sectionsInfo[tableView.indexPathForSelectedRow?.section ?? 0]
        let identifier = Session.shared.infoWorker.itemsFor(section: name)[tableView.indexPathForSelectedRow?.row ?? 0]
        viewController?.identifier = identifier
    }
}
