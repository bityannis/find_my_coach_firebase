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
        ZStack {
            Map()
            Image("GigachadImage").resizable().frame(width: 50, height: 50).cornerRadius(50).offset(x: 1, y: -200)
            Button("Coach Chad is 50 meters from you") {
                
            }.frame(width: 300.0, height: 50.0).background(.orange).foregroundColor(.white).cornerRadius(10).offset(x: 1, y: 300)
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
