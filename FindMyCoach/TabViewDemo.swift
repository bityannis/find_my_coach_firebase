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
            LocationView().tabItem {
                Image(systemName: "mappin")
                Text("Map")
            }
            MessagesView().tabItem {
                Image(systemName: "message.fill")
                Text("Messages")
            }
            ProgramView().tabItem {
                Image(systemName: "dumbbell.fill")
                Text("Program")
            }
        }
    }
}

struct TabViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        TabViewDemo()
    }
}
