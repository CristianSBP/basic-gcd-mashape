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
        
        DispatchQueue.global().async {
            
            let semaphore = DispatchSemaphore(value: 0)
            let group = DispatchGroup()
            
            print("Start 1")
            group.enter()
            DispatchQueue.global().async {
                MashapeApi().getInfo {
                    semaphore.signal()
                    print("Done 1")
                    group.leave()
                }
//                for i in 0...3 {
//                    sleep(1)
//                    print(i)
//                }
            }
            
            _ = semaphore.wait(timeout: .distantFuture)
            
            print("Start 2")
            group.enter()
            DispatchQueue.global().async {
                MashapeApi().cardsBy {
                    print("Done 2")
                    group.leave()
                }
//                for i in 0...3 {
//                    sleep(1)
//                    print(i)
//                }
            }
            
            group.notify(queue: .main) {
                print("DONE ALL WORK")
                self.label.text = "\(Session.shared.cardsCount)"
            }
            
        }
        
    }
}
