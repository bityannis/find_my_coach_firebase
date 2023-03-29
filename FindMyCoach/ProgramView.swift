//
//  ProgramView.swift
//  FindMyCoach
//
//  Created by Tom Rizo on 22/03/2023.
//

import SwiftUI

struct ProgramView: View {
    var programs: [Program] = [
        Program(day: "Lundi", description: "Pectoraux", emoji: "🏋️", fullDescription: "Échauffement : 5 à 10 minutes de cardio léger \n Développé couché avec haltères : 4 séries de 8 à 12 répétitions \n Développé incliné avec haltères : 3 séries de 10 à 12 répétitions \n Écarté incliné avec haltères : 3 séries de 12 à 15 répétitions \n Pull-over avec haltère : 3 séries de 12 à 15 répétitions"),
        Program(day: "Mardi", description: "Biceps", emoji: "💪", fullDescription: "Échauffement : 5 à 10 minutes de cardio léger \n Curl biceps avec haltères : 4 séries de 10 à 12 répétitions \n Curl concentré : 3 séries de 10 à 12 répétitions \n Extension triceps avec haltères : 4 séries de 10 à 12 répétitions \n Pushdown triceps à la poulie : 3 séries de 10 à 12 répétitions"),
        Program(day: "Mercredi", description: "Jambes", emoji: "🦵", fullDescription: "Échauffement : 5 à 10 minutes de cardio léger \n Squat avec barre : 4 séries de 8 à 12 répétitions \n Fentes avec haltères : 3 séries de 10 à 12 répétitions \n Presse à cuisses inclinée : 3 séries de 12 à 15 répétitions \n Soulevé de terre avec barre : 3 séries de 10 à 12 répétitions"),
        Program(day: "Jeudi", description: "10 km", emoji: "🏃‍♂️", fullDescription: "Échauffement : 5 à 10 minutes de marche rapide ou de jogging léger \n Course à pied : 30 minutes à un rythme soutenu \n Marche rapide : 10 minutes à un rythme rapide pour récupérer \n Sprints : 5 x 30 secondes de sprint suivis de 30 secondes de récupération"),
        Program(day: "Vendredi", description: "Jeûne", emoji: "🍛 ❌", fullDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "),
        Program(day: "Samedi", description: "Repos", emoji: "🛌", fullDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "),
        Program(day: "Dimanche", description: "Mindfullness", emoji: "🧘", fullDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "),
    ]
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(.white)]
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 30 / 255, green: 36 / 255, blue: 50 / 255)
                
                VStack {
                    ForEach(programs) { program in
                        NavigationLink {
                            ProgramDetail(program: program)
                        } label: {
                            ZStack {
//                                Rectangle()
//                                    .frame(width: 350, height: 60)
//                                    .cornerRadius(20)
//                                    .foregroundColor(.black)
                                
                                HStack {
                                    Text(program.day)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 30)
                                    
                                    Spacer()
                                    
                                    VStack(alignment: .trailing) {
                                        Text(program.description)
                                            .foregroundColor(.blue)
//                                            .padding(.horizontal, 15)
                                        Text(program.emoji)
//                                            .padding(.horizontal, 50)
                                    }
                                    .padding(.trailing)
                                }
                            }
                        }
                        Divider()
                            .overlay(.white)
                    }
                }.navigationTitle("Programme Semaine")
            }.edgesIgnoringSafeArea(.top)
        }
    }
}

struct ProgramView_Previews: PreviewProvider {
    static var previews: some View {
        ProgramView()
    }
}
