//
//  SummaryView.swift
//  FindMyCoach
//
//  Created by Yannis Kessas on 24/03/2023.
//

import SwiftUI

struct SummaryView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(Date.now, format: .dateTime.day().month().year())
            Text("Sommaire")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
    }
}
