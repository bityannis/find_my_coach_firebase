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
    var profilePicture: String
    var description: String
    var localization: String
    var visioCoaching: Bool
    var irlCoaching: Bool
    var fares: Int
    var coachRating: Double?
    var userReviews = [String: String]()
    var userRatings = [String: Double]()
    func average()-> Double{
        let allRatings = userRatings.values
        var averageRating: Double = 0
        for userRating in allRatings {
            averageRating += userRating
        }
        averageRating = averageRating/(Double(allRatings.count))
        return averageRating
    }
    
}
