//
//  MapLocation.swift
//  FindMyCoach
//
//  Created by Yannis Kessas on 23/03/2023.
//

import SwiftUI

struct MapLocation: Identifiable {
    var id = UUID()
    var name: String
    var latitude: Double
    var longitude: Double
}
