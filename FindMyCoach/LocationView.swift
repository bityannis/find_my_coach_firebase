//
//  MapView.swift
//  FindMyCoach
//
//  Created by Yannis Kessas on 21/03/2023.
//

import SwiftUI

struct LocationView: View {
    @State private var search: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Map()
                Image("GigachadImage").resizable().frame(width: 50, height: 50).cornerRadius(50).offset(x: 1, y: -200)
                NavigationLink {
                    ListOfCoaches()
                } label: {
                    Text("See Coaches around you").frame(width: 300.0, height: 50.0).background(.orange).foregroundColor(.white).cornerRadius(10)
                }
                .padding()

            }
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
