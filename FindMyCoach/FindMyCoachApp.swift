//
//  FindMyCoachApp.swift
//  FindMyCoach
//
//  Created by Yannis Kessas on 21/03/2023.
//

import SwiftUI

@main
struct FindMyCoachApp: App {
    var healthVM = HealthKitViewModel()
    
    var body: some Scene {
        WindowGroup {
//            HealthView().environmentObject(healthVM)
            Login()
        }
    }
}
