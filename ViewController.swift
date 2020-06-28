//
//  ViewController.swift
//  FinalProject_Solarnaut
//
//  Created by Sonia Muzemil on 11/5/19.
//  Copyright © 2019 Sonia Muzemil. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    var currPlanet:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // Set the scene to the view
        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    
    @IBAction func mercuryButton(_ sender: Any) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        retrievePlanets(keyword: currPlanet!)
        if let pvc = segue.destination as? PlanetViewController {
            pvc.showPlanet = currPlanet
        }
    }
    
    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func retrievePlanets(keyword: String) {
        let url = URL(string: "https://api.le-systeme-solaire.net/rest.php/bodies/\(keyword)")
        let data = try! Data(contentsOf: url!)
        //        movieResults = try! JSONDecoder().decode(APIResults.self, from: data)
        //        if let data = movieResults {
        //            movieList = data.results
        //        }
        do {
            let planetRaw = try JSONDecoder().decode(Planet.self, from: data)
            currPlanet = planetRaw
        }
        catch {
            print("retrieving error")
        }
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
