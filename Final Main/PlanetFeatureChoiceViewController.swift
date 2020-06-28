//
//  PlanetFeatureChoiceViewController.swift
//  
//
//  Created by Nehemie Etienne on 11/17/19.
//

import UIKit

class PlanetFeatureChoiceViewController: UIViewController {
    @IBOutlet weak var planetName: UILabel!
    @IBOutlet var orbitBackground: UIView!
    
    @IBOutlet weak var atmosphere: UIView!
    @IBOutlet weak var surface: UIView!
    
    var thisPlanet: ViewController.planetDetails!
    
    
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        planetName.text = thisPlanet.name.uppercased()
        orbitBackground.backgroundColor = thisPlanet.colorScheme[2]
        atmosphere.backgroundColor = thisPlanet.colorScheme[1]
        surface.backgroundColor = thisPlanet.colorScheme[0]
        // Do any additional setup after loading the view.
    }
    
    @IBAction func orbitButton(_ sender: Any) {
        performSegue(withIdentifier: "toOrbit", sender: self)
    }
    
    @IBAction func atmosphereButton(_ sender: Any) {
        performSegue(withIdentifier: "toAtmosphere", sender: self)
    }
    
    @IBAction func surfaceButton(_ sender: Any) {
        performSegue(withIdentifier: "toSurface", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //print("moving to " + destination)
        if (segue.identifier == "backMain"){
            let vc = segue.destination as! PlanetViewController
            vc.thisPlanet = thisPlanet
            return
    }
        
        let vc = segue.destination as! FeatureSpecificViewController
        vc.thisPlanet = thisPlanet
        
        if(segue.identifier == "toOrbit"){
            vc.backgroundColor = thisPlanet.colorScheme[0]
            vc.pageTitle = "orbit"
            vc.textArea = thisPlanet.orbit + "\n\n" + thisPlanet.orbit2
            vc.planetname = thisPlanet.name
        }
        
        if(segue.identifier == "toAtmosphere"){
            vc.backgroundColor = thisPlanet.colorScheme[1]
            vc.pageTitle = "atmosphere"
            vc.textArea = thisPlanet.atmosphere + "\n\n" + thisPlanet.atmosphere2
            vc.planetname = thisPlanet.name
        }
        
        if(segue.identifier == "toSurface"){
            vc.backgroundColor = thisPlanet.colorScheme[2]
            vc.pageTitle = "surface"
            vc.textArea = thisPlanet.surface
            vc.planetname = thisPlanet.name
        }
        
        
        

      
        
        
    }
    
    @IBAction func backMain(_ sender: Any) {
        performSegue(withIdentifier: "backMain", sender: self)
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
