//
//  Post.swift
//  FindMyCoach
//
//  Created by Yannis Kessas on 27/03/2023.
//

import SwiftUI

struct Post: Identifiable, Decodable {
    var id: String {
        return objectID
    }
    var objectID: String
    var title: String
    var points: Int
    var url: String?
}

