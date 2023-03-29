//
//  Message.swift
//  FindMyCoach
//
//  Created by Yannis Kessas on 29/03/2023.
//

import Foundation

struct Message: Identifiable {
    var id = UUID()
    let sender: String
    let body: String
    let date: Double
}
