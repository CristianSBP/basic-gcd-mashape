//
//  InfoTableViewController.swift
//  mashape-heartstone
//
//  Created by Cristian Palomino Rivera on 8/10/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class InfoTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var infoViewModel: InfoViewModel = InfoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoViewModel.fetchInfo()
        infoViewModel.delegate = self
        prepare()
        registerCells()
    }
    
    private func prepare() {
        tableView.dataSource = infoViewModel
        tableView.delegate = infoViewModel
    }
    
    private func registerCells() {
        tableView.register(PatchTableViewCell.nib, forCellReuseIdentifier: PatchTableViewCell.identifier)
        tableView.register(ClassesTableViewCell.nib, forCellReuseIdentifier: ClassesTableViewCell.identifier)
        tableView.register(SetsTableViewCell.nib, forCellReuseIdentifier: SetsTableViewCell.identifier)
        tableView.register(TypesTableViewCell.nib, forCellReuseIdentifier: TypesTableViewCell.identifier)
        tableView.register(FactionsTableViewCell.nib, forCellReuseIdentifier: FactionsTableViewCell.identifier)
        tableView.register(QualitiesTableViewCell.nib, forCellReuseIdentifier: QualitiesTableViewCell.identifier)
        tableView.register(RacesTableViewCell.nib, forCellReuseIdentifier: RacesTableViewCell.identifier)
        tableView.register(LocalesTableViewCell.nib, forCellReuseIdentifier: LocalesTableViewCell.identifier)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as? CardsTableViewController
        let name = Session.shared.infoWorker.sectionsInfo[tableView.indexPathForSelectedRow?.section ?? 0]
        let identifier = Session.shared.infoWorker.itemsFor(section: name)[tableView.indexPathForSelectedRow?.row ?? 0]
        viewController?.identifier = identifier
    }
}

extension InfoTableViewController: InfoViewModelDelegate {
    
    func infoFetched() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
