//
//  Planet.swift
//  FinalProject_Solarnaut
//
//  Created by Sonia Muzemil on 11/13/19.
//  Copyright © 2019 Sonia Muzemil. All rights reserved.
//

import Foundation

struct Planet: Decodable {
    let id: String
    let name: String
    let englishName: String
    let moons: [String]
    let density: Float
    let gravity: Float
    let meanRadius: Float
    let equaRadius: Float
    let polarRadius: Float
    let discoveredBy: String
    let discoveryDate: String
    let alternativeName: String
}
