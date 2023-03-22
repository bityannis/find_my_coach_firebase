//
//  ProgramView.swift
//  FindMyCoach
//
//  Created by Yannis Kessas on 22/03/2023.
//

import SwiftUI

struct ProgramView: View {
    var programs: [Program] = [
        Program(day: "Monday", description: "Pectoral", emoji: "🏋️", fullDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "),
        Program(day: "Tuesday", description: "Biceps", emoji: "💪", fullDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "),
        Program(day: "Wednesday", description: "Legs", emoji: "🦵", fullDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "),
        Program(day: "Thursday", description: "10 km", emoji: "🏃‍♂️", fullDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "),
        Program(day: "Friday", description: "Fasting", emoji: "🍛 ❌", fullDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "),
        Program(day: "Saturday", description: "Rest", emoji: "🛌", fullDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "),
        Program(day: "Sunday", description: "Mindfullness", emoji: "🧘", fullDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "),
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                List(programs) { program in
                    NavigationLink {
                        ProgramDetail(program: program)
                    } label: {
                        HStack {
                            Text(program.day)
                                .font(.title2)
                                .fontWeight(.bold)
                            Spacer()
                            VStack(alignment: .center) {
                                Text(program.description)
                                Text(program.emoji)
                            }
                            .padding(.trailing)
                           
                        }
                    }
                    
                }
                
            }
            .navigationTitle("Week 1")
        }
    }
}

struct ProgramView_Previews: PreviewProvider {
    static var previews: some View {
        ProgramView()
    }
}
