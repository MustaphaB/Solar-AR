//
//  PlanetViewController.swift
//  
//
//  Created by Nehemie Etienne on 11/17/19.
//

import UIKit

class PlanetViewController: UIViewController {
    @IBOutlet weak var planetName: UILabel!
    @IBOutlet weak var overViewText: UILabel!
    @IBOutlet weak var mainBodyText: UILabel!
    @IBOutlet weak var characteristicsText: UILabel!
    @IBOutlet weak var lifeText: UILabel!
    @IBOutlet var background: UIView!
    
    var thisPlanet: ViewController.planetDetails!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        background.backgroundColor = thisPlanet?.colorScheme[1]
        outlet.image = UIImage (named: thisPlanet.name)
        planetName.text = thisPlanet?.name
        
        
        overViewText.text = thisPlanet?.overview
        mainBodyText.text = thisPlanet?.mainBodies
        characteristicsText.text = thisPlanet?.characteristics
        lifeText.text = thisPlanet?.life
        
        
    }

    
    @IBAction func proceedButton(_ sender: Any) {
        performSegue(withIdentifier: "toPlanetChooser", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier != "back"){
            let vc = segue.destination as! PlanetFeatureChoiceViewController
            vc.thisPlanet = thisPlanet
        }
    }
    

    @IBOutlet weak var outlet: UIImageView!
    

}
