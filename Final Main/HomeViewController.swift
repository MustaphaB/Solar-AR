//
//  HomeViewController.swift
//  Final Main
//
//  Created by Nehemie Etienne on 11/19/19.
//  Copyright © 2019 Nehemie Etienne, Jefferson Duan, Mustapha Barriem, Sonia Muzemil, Miles Lee. All rights reserved.
//
//  AR Planet Views attribute to https://github.com/jacobsteves/AR-Solar-System

import UIKit
import ARKit
import SceneKit

class HomeViewController: UIViewController, ARSCNViewDelegate, SCNPhysicsContactDelegate {

    @IBOutlet weak var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateColorArray()
        
        sceneView.delegate = self
        sceneView.showsStatistics = true
        sceneView.scene = SCNScene()
    
    }
    
    var planetCollection: [String:PlanetInfo] = [:]
    var planetData: ViewController.planetDetails?
    
    
    struct P: Decodable{
        var planetInfo:[PlanetInfo]
       
    }

    // MARK: - PlanetInfo

    
    // MARK: - PlanetInfo
    struct PlanetInfo: Codable {
        let name, color, overview, mainBodies: String
        let characteristics, life, surface, atmosphere: String
        let atmosphere2, orbit, orbit2: String
    }


    @IBAction func testQuery(_ sender: Any) {
        let nURL  = URL(string: "https://demo8473629.mockable.io/planets")
//        var request = URLRequest(url: URL(string: "https://demo8473629.mockable.io/planets")!)
//        request.httpMethod = "GET"
//        let session = URLSession.shared
//
//        session.dataTask(with: request) {data, response, err in
//            print("Entered the completionHandler")
//            }.resume()

        let data = try! Data(contentsOf: nURL!)
        do {
            
            let planetRaw = try JSONDecoder().decode(P.self, from: data)
            populatePlanetInfo(planetRaw)
        
        }
        catch {
           
        }
    }
    
    func populatePlanetInfo(_ planetRaw: P){
        for planet in planetRaw.planetInfo{
            planetCollection[planet.name] = planet
        }
    }
    
//    @IBAction func neptune(_ sender: UIButton) {
//        performSegue(withIdentifier: "Neptune", sender: self)
//    }
//
//    @IBAction func Uranus(_ sender:UIButton) {
//        performSegue(withIdentifier: "Uranus", sender: self)
//    }
//
//    @IBAction func Saturn(_ sender:UIButton) {
//        performSegue(withIdentifier: "Saturn", sender: self)
//    }
//
//    @IBAction func Mars(_ sender: UIButton) {
//        performSegue(withIdentifier: "Mars", sender: self)
//    }
//
//    @IBAction func Jupiter(_ sender: UIButton) {
//        performSegue(withIdentifier: "Jupiter", sender: self)
//    }
//
//    @IBAction func Earth(_ sender: UIButton) {
//        performSegue(withIdentifier: "Earth", sender: self)
//
//    }
//
//    @IBAction func Venus(_ sender:  UIButton) {
//        performSegue(withIdentifier: "Venus", sender: self)
//    }
//
//    @IBAction func Mercury(_ sender: UIButton) {
//            performSegue(withIdentifier: "Mercury", sender: self)
//    }

    
    func doPlanetQuery(_ planetName: String){
        let nURL  = URL(string: "https://demo8473629.mockable.io/planets")
  
        let data = try! Data(contentsOf: nURL!)
        do {
            
            let planetRaw = try JSONDecoder().decode(P.self, from: data)
            populatePlanetInfo(planetRaw)
        }
        catch {
        }
        
   
         let currPlanet = planetCollection[planetName]
//        let selectScheme = colorArray.randomElement()!
    
        
   
        planetData = ViewController.planetDetails(name: currPlanet!.name, color: color, overview: currPlanet!.overview, mainBodies: currPlanet!.mainBodies, characteristics: currPlanet!.characteristics, life: currPlanet!.life, colorScheme: colorArray[currPlanet!.name]!, surface: currPlanet!.surface, atmosphere: currPlanet!.atmosphere, atmosphere2: currPlanet!.atmosphere2, orbit: currPlanet!.orbit, orbit2: currPlanet!.orbit2)
        
//        if(planetName != "Mercury"){
//            planetData = ViewController.planetDetails(name: name, color: color, overview: overview, mainBodies: mainBodies, characteristics: characteristics, life: life, colorScheme: colorArray.randomElement()!, surface: surface, atmosphere: atmosphere, atmosphere2: atmosphere2, orbit: orbit, orbit2: orbit2)
//        }
//        else{
//            planetData = ViewController.planetDetails(name: "we", color: UIColor.brown, overview: "w", mainBodies: "efre", characteristics: "revrew", life: "efw", colorScheme: colorArray.randomElement()!, surface: "wefwf", atmosphere: "efwfw", atmosphere2: "efww", orbit: "rfwe", orbit2: "dewfewfeefwvfewfew")
//        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        doPlanetQuery((segue.identifier)!)
        
        
        
        let vc = segue.destination as! PlanetViewController
  
        vc.thisPlanet = planetData
        
    }

    
    var colorArray: [String: [UIColor]] = [:]
    func populateColorArray(){
        
        colorArray["Neptune"] = [
            UIColor.init(red: 124/255.0, green: 150/255.0, blue: 228/255.0, alpha: 0.5),
            UIColor.init(red: 175/255.0, green: 210/255.0, blue: 233/255.0, alpha: 0.5),
            UIColor.init(red: 154/255.0, green: 113/255.0, blue: 151/255.0, alpha: 0.5)
            ]
        
        colorArray["Uranus"] = [
            UIColor.init(red: 25/255.0, green: 122/255.0, blue: 156/255.0, alpha: 0.5),
            UIColor.init(red: 227/255.0, green: 216/255.0, blue: 241/255.0, alpha: 0.5),
            UIColor.init(red: 218/255.0, green: 190/255.0, blue: 202/255.0, alpha: 0.5)
        ]
        
        colorArray["Saturn"] = [
            UIColor.init(red: 210/255.0, green: 190/255.0, blue: 143/255.0, alpha: 0.5),
            UIColor.init(red: 176/255.0, green: 73/255.0, blue: 63/255.0, alpha: 0.5),
            UIColor.init(red: 126/255.0, green: 141/255.0, blue: 133/255.0, alpha: 0.5)
        ]
        
        colorArray["Mars"] = [
            UIColor.init(red: 197/255.0, green: 117/255.0, blue: 103/255.0, alpha: 0.5),
            UIColor.init(red: 252/255.0, green: 122/255.0, blue: 87/255.0, alpha: 0.5),
            UIColor.init(red: 179/255.0, green: 140/255.0, blue: 180/255.0, alpha: 0.5)
        ]
        
        colorArray["Jupiter"] = [
            UIColor.init(red: 203/255.0, green: 170/255.0, blue: 74/255.0, alpha: 0.5),
            UIColor.init(red: 210/255.0, green: 187/255.0, blue: 160/255.0, alpha: 0.5),
            UIColor.init(red: 242/255.0, green: 239/255.0, blue: 199/255.0, alpha: 0.5)
        ]
        
        colorArray["Earth"] = [
            UIColor.init(red: 68/255.0, green: 103/255.0, blue: 212/255.0, alpha: 0.5),
            UIColor.init(red: 172/255.0, green: 173/255.0, blue: 188/255.0, alpha: 0.5),
            UIColor.init(red: 56/255.0, green: 59/255.0, blue: 83/255.0, alpha: 0.5)
        ]
        
        colorArray["Venus"] = [
            UIColor.init(red: 209/255.0, green: 142/255.0, blue: 74/255.0, alpha: 0.5),
            UIColor.init(red: 232/255.0, green: 218/255.0, blue: 178/255.0, alpha: 0.5),
            UIColor.init(red: 192/255.0, green: 214/255.0, blue: 223/255.0, alpha: 0.5)
        ]
        
        colorArray["Mercury"] = [
            UIColor.init(red: 209/255.0, green: 142/255.0, blue: 74/255.0, alpha: 0.5),
            UIColor.init(red: 245/255.0, green: 224/255.0, blue: 183/255.0, alpha: 0.5),
            UIColor.init(red: 133/255.0, green: 126/255.0, blue: 123/255.0, alpha: 0.5)
            ]
        
        //        colorArray.append([
        //            UIColor.init(red: <#T##CGFloat#>, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: 0.5),
        //            UIColor.init(red: <#T##CGFloat#>, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: 0.5),
        //            UIColor.init(red: <#T##CGFloat#>, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: 0.5)
        //            ])
        
    }
    
    

    
    
    
    
    var name = "Neptune"
    var color = UIColor.blue;
    var overview = "Neptune is dark, cold, and very windy. It's the last of the planets in our solar system. It's more than 30 times as far from the sun as the Earth is."
    var mainBodies = "Neptune has 8 moons: Naiad, Thalssa, Despina, Galatea, Larissa, Proteus, Triton and Nereid."
    var characteristics = "Neptune has six known rings. The planet is about four times wider than Earth. If Earth were a large apple, Neptune would be the size of a basketball."
    var life = "Neptune cannot support life as we know it."
    
    var surface = "Mercury is a rocky planet, alkso known as a terrestrial planet. It has a solid, cratered surface, much like the Earth's moon."
    
    var atmosphere = "Mercury's thin atmosphere, or exosphere, is composed mostly of oxygen (O2), sodium (Na), hydrogen (H2), helium (He), and potassium (K). Atoms that are blasted off the surface by the solar wind and micrometeoroid impacts create Mercury's exosphere."
    
    var atmosphere2 = "No evidence for life has been found on Mercury. Daytime Temperatures can reach 430 degrees Celsius (800 degrees Fahrenheit) and drop to -180 degrees Celsius (-290 degrees Fahrenheit) at night. It is unlikely life (as we know it) could survive on this planet."
    
    var orbit = "One day on Mercury (the time it takes for Mercury to rotate or spin once with respect to the stars) takes 59 Earth days. One day-night cycle on Mercury takes 175.97 Earth days. Mercury makes a complete orbit around the Sun (a year in Mercury time) in just 88 Earth days."
    
    var orbit2 = "Because of Mercury's elliptical—egg-shaped—orbit and sluggish rotation, the morning Sun appears to rise briefly, set and rise again from some parts of the planet's surface. The same thing happens in reverse at sunset."

    /*
  // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = ARWorldTrackingConfiguration.PlaneDetection.horizontal
        sceneView.session.run(configuration)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        if(touch.view == self.sceneView){
            print("touch working")
            var planet = ""
            let viewTouchLocation:CGPoint = touch.location(in: sceneView)
            guard let result = sceneView.hitTest(viewTouchLocation, options: nil).first else {
                return
            }
            
            print(result.node.geometry?.boundingSphere.radius)
            
            if(result.node.geometry?.boundingSphere.radius == 0.35){
                return
            }
            if(result.node.geometry?.boundingSphere.radius == 0.05){
                return
            }
            
            if(result.node.geometry?.boundingSphere.radius == 0.02){
                print("mercury")
                planet = "mercury"
            }
            if(result.node.geometry?.boundingSphere.radius == 0.08){
                print("venus")
                planet = "venus"
            }
            if(result.node.geometry?.boundingSphere.radius == 0.2){
                print("earth")
                planet = "earth"
            }
            if(result.node.geometry?.boundingSphere.radius == 0.1){
                print("mars")
                planet = "mars"
            }
            if(result.node.geometry?.boundingSphere.radius == 1){
                print("jupiter")
                planet = "jupiter"
            }
            if(result.node.geometry?.boundingSphere.radius == 0.8){
                print("saturn")
                planet = "saturn"
            }
            if(result.node.geometry?.boundingSphere.radius == 0.5){
                print("uranus")
                planet = "uranus"
            }
            if(result.node.geometry?.boundingSphere.radius == 0.45){
                print("neptune")
                planet = "neptune"
            }
            
            OperationQueue.main.addOperation {
                [weak self] in
                if (planet == "mercury"){
                    self?.performSegue(withIdentifier: "Mercury", sender: self)
                }
                if (planet == "venus"){
                    self?.performSegue(withIdentifier: "Venus", sender: self)
                }
                if (planet == "earth"){
                    self?.performSegue(withIdentifier: "Earth", sender: self)
                }
                if (planet == "mars"){
                    self?.performSegue(withIdentifier: "Mars", sender: self)
                }
                if (planet == "jupiter"){
                    self?.performSegue(withIdentifier: "Jupiter", sender: self)
                }
                if (planet == "saturn"){
                    self?.performSegue(withIdentifier: "Saturn", sender: self)
                }
                if (planet == "uranus"){
                    self?.performSegue(withIdentifier: "Uranus", sender: self)
                }
                if (planet == "neptune"){
                    self?.performSegue(withIdentifier: "Neptune", sender: self)
                }
                //self?.performSegue(withIdentifier: "test", sender: self)
            }
            
        }
    }
    
    
    
    
    /* When the view appears, we create the planet objects. The sun is unique and gets created first. Other planets are
     * created by making a call to the generatePlanetWithOrbit
     */
    override func viewDidAppear(_ animated: Bool) {
        let sun = SCNNode(geometry: SCNSphere(radius: 0.35))
        
        sun.geometry?.firstMaterial?.diffuse.contents = #imageLiteral(resourceName: "Sun diffuse")
        sun.position = SCNVector3(0,0,-1)
        let sunRotator = Rotation(time: 8)
        sun.runAction(sunRotator)
        
        self.sceneView.scene.rootNode.addChildNode(sun)
        
        let mercury = generatePlanetWithOrbit(root: nil, orbitRoot: SCNVector3(0,0,-1), rotation: 10, geometry: SCNSphere(radius: 0.02), diffuse: #imageLiteral(resourceName: "Mercury Diffuse"), specular: nil, emission: nil, normal: nil, position: SCNVector3(1,0,0))
        let venus = generatePlanetWithOrbit(root: nil, orbitRoot: SCNVector3(0,0,-1), rotation: 15, geometry: SCNSphere(radius: 0.08), diffuse: #imageLiteral(resourceName: "Venus Surface"), specular: nil, emission: #imageLiteral(resourceName: "Venus Atmosphere"), normal: nil, position: SCNVector3(2,0,0))
        let earth = generatePlanetWithOrbit(root: nil, orbitRoot: SCNVector3(0,0,-1), rotation: 20, geometry: SCNSphere(radius: 0.2), diffuse: #imageLiteral(resourceName: "Earth day"), specular: #imageLiteral(resourceName: "Earth Specular"), emission: #imageLiteral(resourceName: "Earth Emission"), normal: #imageLiteral(resourceName: "Earth Normal"), position: SCNVector3(3,0,0))
        let moon = generatePlanetWithOrbit(root: earth, orbitRoot: SCNVector3(3,0,0), rotation: 5, geometry: SCNSphere(radius: 0.05), diffuse: #imageLiteral(resourceName: "Moon Diffuse"), specular: nil, emission: nil, normal: nil, position: SCNVector3(0,0,-0.3))
        let mars = generatePlanetWithOrbit(root: nil, orbitRoot: SCNVector3(0,0,-1), rotation: 25, geometry: SCNSphere(radius: 0.1), diffuse: #imageLiteral(resourceName: "Mars Diffuse"), specular: nil, emission: nil, normal: nil, position: SCNVector3(6,0,0))
        let jupiter = generatePlanetWithOrbit(root: nil, orbitRoot: SCNVector3(0,0,-1), rotation: 40, geometry: SCNSphere(radius: 1), diffuse: #imageLiteral(resourceName: "Jupiter Diffuse"), specular: nil, emission: nil, normal: nil, position: SCNVector3(14,0,0))
        let saturn = generatePlanetWithOrbit(root: nil, orbitRoot: SCNVector3(0,0,-1), rotation: 50, geometry: SCNSphere(radius: 0.8), diffuse: #imageLiteral(resourceName: "Saturn Diffuse"), specular: nil, emission: nil, normal: nil, position: SCNVector3(15,0,0))
        let saturnRing = generatePlanetWithOrbit(root: saturn, orbitRoot: SCNVector3(0,0,0), rotation: 0, geometry: SCNTorus(ringRadius: 1.2, pipeRadius: 0.1), diffuse: #imageLiteral(resourceName: "Moon Diffuse"), specular: nil, emission: nil, normal: nil, position: SCNVector3(15,0,0))
        let uranus = generatePlanetWithOrbit(root: nil, orbitRoot: SCNVector3(0,0,-1), rotation: 80, geometry: SCNSphere(radius: 0.5), diffuse: #imageLiteral(resourceName: "Uranus Diffuse"), specular: nil, emission: nil, normal: nil, position: SCNVector3(18,0,0))
        let neptune = generatePlanetWithOrbit(root: nil, orbitRoot: SCNVector3(0,0,-1), rotation: 100, geometry: SCNSphere(radius: 0.45), diffuse: #imageLiteral(resourceName: "Neptune Diffuse"), specular: nil, emission: nil, normal: nil, position: SCNVector3(20,0,0))
    }
    
    /* Create a planet and a planet parent and have the planet orbit the planet parent. This simulates the gravitational
     * orbit that the sun creates. As planets get farther from the sun, the gravitational pull is weaker, so the orbit is
     * slower. This approach lets us change the speed that the planet parent's children orbit, so as the planet gets
     * farther from the sun, we can just decrease this speed.
     *
     * @return SCNNode -    The planet parent. This is the object that lets the planet orbit. If creating a moon, you
     *                      want root to be the planet parent of the moon's planet. (eg, Earth is the moons planet
     *                      parent)
     */
    func generatePlanetWithOrbit(root: SCNNode?, orbitRoot: SCNVector3, rotation: TimeInterval, geometry: SCNGeometry, diffuse: UIImage, specular: UIImage?, emission: UIImage?, normal: UIImage?, position: SCNVector3) -> SCNNode {
        
        let parent = SCNNode()
        parent.position = orbitRoot
        self.sceneView.scene.rootNode.addChildNode(parent)
        
        let newPlanet = planet(geometry: geometry, diffuse: diffuse, specular: specular, emission: emission, normal: normal, position: position)
        
        let planetRotation = Rotation(time: 8)
        let rootRotation = Rotation(time: rotation)
        
        newPlanet.runAction(planetRotation)
        parent.runAction(rootRotation)
        parent.addChildNode(newPlanet)
        root?.addChildNode(parent)
        
        return parent
    }
    
    func planet(geometry: SCNGeometry, diffuse: UIImage, specular: UIImage?, emission: UIImage?, normal: UIImage?, position: SCNVector3) -> SCNNode {
        let planet = SCNNode(geometry: geometry)
        planet.geometry?.firstMaterial?.diffuse.contents = diffuse
        planet.geometry?.firstMaterial?.emission.contents = emission
        planet.geometry?.firstMaterial?.specular.contents = specular
        planet.geometry?.firstMaterial?.normal.contents = normal
        planet.position = position
        return planet
    }
    
    func Rotation(time: TimeInterval) -> SCNAction {
        let rotation = time != 0 ? 360.degreesToRadians : 0
        let rotator = SCNAction.rotateBy(x:0, y: CGFloat(rotation), z: 0, duration: time != 0 ? time : 1)
        let foreverRotator = SCNAction.repeatForever(rotator)
        return foreverRotator
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension Int {
    var degreesToRadians: Double { return Double(self) * .pi/180}
}

