//
//  Program.swift
//  FindMyCoach
//
//  Created by Yannis Kessas on 22/03/2023.
//

import SwiftUI

struct Program: Identifiable {
    var id = UUID()
    var day: String
    var description: String
    var emoji: String
    var fullDescription: String
}
