//
//  InfoTableViewController.swift
//  mashape-heartstone
//
//  Created by Cristian Palomino Rivera on 8/10/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class InfoTableViewController: UITableViewController {

    var arrayOfKeys: [String] = []

    var infoData: [String: [String]] = [:] {
        didSet {
            arrayOfKeys = Array(infoData.keys)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callInfo()
    }
    
    private func callInfo() {
        MashapeApi().getInfo {
            self.infoData = Session.shared.info
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return arrayOfKeys.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionKey = arrayOfKeys[section]
        return infoData[sectionKey]!.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrayOfKeys[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let sectionKey = arrayOfKeys[indexPath.section]
        let label = infoData[sectionKey]![indexPath.row]
        cell.textLabel?.text = label
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
