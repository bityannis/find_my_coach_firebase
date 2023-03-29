//
//  FindMyCoachApp.swift
//  FindMyCoach
//
//  Created by Yannis Kessas on 21/03/2023.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

//@main
//struct FindMyCoachApp: App {
//    var healthVM = HealthKitViewModel()
//
//    var body: some Scene {
//        WindowGroup {
////            HealthView().environmentObject(healthVM)
//            Login()
//        }
//    }
//}

@main
struct FindMyCoachApp: App {
    //    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    init() {
        FirebaseApp.configure()
//        let db = Firestore.firestore()
//        debugPrint(db)
    }
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                WelcomeView()
            }
        }
    }
}
