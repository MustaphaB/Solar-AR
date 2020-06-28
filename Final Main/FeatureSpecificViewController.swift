//
//  FeatureSpecificViewController.swift
//  Final Main
//
//  Created by Nehemie Etienne on 11/19/19.
//  Copyright © 2019 Nehemie Etienne. All rights reserved.
//

import UIKit

class FeatureSpecificViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        planetName.text = (planetname?.uppercased())! + "'S"
        pageFeature.text = pageTitle
        view.backgroundColor = backgroundColor
        pageText.text = textArea
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var planetName: UILabel!
    @IBOutlet weak var pageFeature: UILabel!
    @IBOutlet weak var pageText: UILabel!
    
    var thisPlanet: ViewController.planetDetails!
    var textArea: String?
    var planetname: String?
    var backgroundColor: UIColor?
    var pageTitle: String?

    @IBAction func toFeature(_ sender: Any) {
        performSegue(withIdentifier: "toFeature", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! PlanetFeatureChoiceViewController
        vc.thisPlanet = thisPlanet
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
