//
//  ObjectivesView.swift
//  FindMyCoach
//
//  Created by Yannis Kessas on 24/03/2023.
//

import SwiftUI

struct ObjectivesView: View {
    @State private var multiSelection = Set<UUID>()
    var body: some View {
       VStack (alignment: .leading){
            Text("Mes Objectifs")
                .font(.largeTitle)
                .padding()
            NavigationStack {
                List(entrainements, selection: $multiSelection){ entrainement in
                    HStack {

                        Text(entrainement.defis)


                    }
                    .navigationTitle("")

                }
                .toolbar { EditButton() }
                Text("\(multiSelection.count) selections")

            }
          }
        }
    }


struct ObjectivesView_Previews: PreviewProvider {
    static var previews: some View {
        ObjectivesView()
    }
}

 private var entrainements = [
    Objective(defis:"Perdre du poids", logo: "star.fill"),
    Objective(defis:"Prise de masse", logo: "star.fill"),
    Objective(defis:"Prise de Muscles", logo: "star.fill"),
    Objective(defis:"Courir 1km", logo: "star.fill"),
    Objective(defis:"Réaliser un premier marathon", logo: "star.fill"),
    Objective(defis:"Faire 100 pompes", logo: "star.fill"),
    Objective(defis:"Gagner du cardio", logo: "star.fill"),
    Objective(defis:"SaintéTic", logo: "star.fill"),
    Objective(defis:"Iron Man", logo: "star.fill"),
    Objective(defis:"Être le nemesis de GigaChad", logo: "star.fill"),
]
