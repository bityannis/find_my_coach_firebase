//
//  ProgramDetail.swift
//  FindMyCoach
//
//  Created by Yannis Kessas on 22/03/2023.
//

import SwiftUI

struct ProgramDetail: View {
    var program: Program = Program(day: "Monday", description: "Pecs", emoji: "🏋️", fullDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ")
    var body: some View {
        VStack {
            Text(program.day)
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
            Text(program.description)
                .font(.title)
            Text(program.emoji)
                .font(.largeTitle)
            Spacer()
            Text(program.fullDescription)
            Spacer()
        }
        .padding()
    }
}

struct ProgramDetail_Previews: PreviewProvider {
    static var previews: some View {
        ProgramDetail()
    }
}
