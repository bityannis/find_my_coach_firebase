//
//  User.swift
//  FindMyCoach
//
//  Created by Yannis Kessas on 21/03/2023.
//

import SwiftUI

struct User: Identifiable {
    var id = UUID()
    var firstName: String
    var lastName: String
    var age: Int
    var objectives: [String]
    var weight: Int?
    var height: Int?
    var profilePicture: Image
}
