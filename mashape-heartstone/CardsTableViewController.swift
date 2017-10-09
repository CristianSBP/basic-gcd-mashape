//
//  CardsTableViewController.swift
//  mashape-heartstone
//
//  Created by Cristian Palomino Rivera on 8/10/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit
import Nuke

class CardsTableViewController: UITableViewController {

    public var identifier: String! {
        didSet {
            items = Session.shared.infoWorker.cardsBy(name: identifier)
        }
    }
    
    private var items: [[String: Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "ImageCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ImageCell
        let object = items[indexPath.row]
        cell.loardURL(object)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
}

extension CardsTableViewController: FetchInfoWorkerDelegate {
    
    func fetchedDone() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

class ImageCell: UITableViewCell {
    
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    func loardURL(_ object: [String: Any]) {
        indicator.startAnimating()
        if let img = object["img"] as? String, let url = URL(string: img) {
            print("LOAD -> \(self)")
            Nuke.loadImage(with: url, into: self, handler: { [weak self] (result, bool) in
                self?.cardImage.image = result.value
                self?.indicator.stopAnimating()
            })
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        print("CANCEL -> \(self)")
        Nuke.cancelRequest(for: self)
        cardImage.layer.removeAllAnimations()
        cardImage.image = nil
    }
}
