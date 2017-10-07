//
//  ViewController.swift
//  mashape-heartstone
//
//  Created by Cristian Palomino Rivera on 1/10/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MashapeApi().getInfo() { result in
            print(result)
        }
    }
}
