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
                VStack {
                    Spacer()
                    NavigationLink {
                        ListOfCoaches()
                    } label: {
                        Text("Voir les coachs aux alentours").frame(width: 300.0, height: 50.0).background(.orange).foregroundColor(.black).cornerRadius(10)
                    }
                .padding()
                }

            }
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
