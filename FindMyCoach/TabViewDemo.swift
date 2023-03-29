//
//  TabViewDemo.swift
//  FindMyCoach
//
//  Created by Yannis Kessas on 22/03/2023.
//

import SwiftUI

struct TabViewDemo: View {
    
    init() {
           UITabBar.appearance().backgroundColor = UIColor.black // Set tab bar background color here
       }

    var body: some View {
        TabView {
            HomeView().tabItem {
                Image(systemName: "person.fill")
                Text("Sommaire")
            }.toolbarBackground(Color.black, for: .tabBar)
            
            LocationView().tabItem {
                Image(systemName: "mappin")
                Text("Carte")
            }.toolbarBackground(Color.black, for: .tabBar)
            
            NewMessagerie().tabItem {
                Image(systemName: "message.fill")
                Text("Messages")
            }.toolbarBackground(Color.black, for: .tabBar)
            
            ProgramView().tabItem {
                Image(systemName: "dumbbell.fill")
                Text("Programme")
            }.toolbarBackground(Color.black, for: .tabBar)
            
        }
        .accentColor(.orange)
        .navigationBarHidden(true)
    }
}

struct TabViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        TabViewDemo()
    }
}
