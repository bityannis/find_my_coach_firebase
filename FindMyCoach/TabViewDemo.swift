//
//  TabViewDemo.swift
//  FindMyCoach
//
//  Created by Yannis Kessas on 22/03/2023.
//

import SwiftUI

struct TabViewDemo: View {
    var body: some View {
        TabView {
            HomeView().tabItem {
                Image(systemName: "person.fill")
                Text("Sommaire")
            }
            LocationView().tabItem {
                Image(systemName: "mappin")
                Text("Carte")
            }
            MessagesView().tabItem {
                Image(systemName: "message.fill")
                Text("Messages")
            }
            ProgramView().tabItem {
                Image(systemName: "dumbbell.fill")
                Text("Programme")
            }
        }
    }
}

struct TabViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        TabViewDemo()
    }
}
