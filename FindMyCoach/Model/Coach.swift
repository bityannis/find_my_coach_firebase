//
//  Coach.swift
//  FindMyCoach
//
//  Created by Yannis Kessas on 21/03/2023.
//

import SwiftUI

struct Coach: Identifiable {
    var id = UUID()
    var firstName: String
    var lastName: String
    var age: Int?
    var skills: String
    var profilePicture: Image
    var description: String
    var localization: String
    var visioCoaching: Bool
    var irlCoaching: Bool
    var fares: Int
}
