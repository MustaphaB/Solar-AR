//
//  ViewController.swift
//  Final Main
//
//  Created by Nehemie Etienne on 11/17/19.
//  Copyright © 2019 Nehemie Etienne, Jefferson Duan, Mustapha Barriem, Sonia Muzemil, Miles Lee. All rights reserved.
//

import UIKit
import SQLite3

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    struct planetDetails {
        var name:String
        var color:UIColor
        var overview:String
        var mainBodies: String
        var characteristics: String
        var life: String
        var colorScheme: [UIColor]
        
        var surface: String
        var atmosphere: String
        var atmosphere2: String
        var orbit: String
        var orbit2: String
    }
    @IBAction func enter(_ sender: Any) {
        performSegue(withIdentifier: "toPlanetDetail", sender: self)
    }

}

