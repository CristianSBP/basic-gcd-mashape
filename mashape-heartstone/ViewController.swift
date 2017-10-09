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
        
//        let queue = DispatchQueue(label: "com.knowstack.queue1")
//        let queue2 = DispatchQueue(label: "queue", qos: .background, attributes: .concurrent)
//        queue2.async {
//            self.printApples()
//        }
//        queue2.async {
//            self.printStrawberries()
//        }
//        queue2.async {
//            self.printBalls()
//        }
    }
    
    func printApples(){
        print("printApples is running on = \(Thread.isMainThread ? "Main Thread":"Background Thread")")
        for i in 0..<3{
            print("🍏\(i)")
        }
    }
    
    func printStrawberries(){
        print("printStrawberries is running on = \(Thread.isMainThread ? "Main Thread":"Background Thread")")
        for i in 0..<3{
            print("🍓\(i)")
        }
    }
    
    func printBalls(){
        print("printBalls is running on = \(Thread.isMainThread ? "Main Thread":"Background Thread")")
        for i in 0..<3{
            print("🎱\(i)")
        }
    }
}
