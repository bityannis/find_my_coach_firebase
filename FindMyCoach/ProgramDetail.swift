//
//  ProgramDetail.swift
//  FindMyCoach
//
//  Created by Yannis Kessas on 22/03/2023.
//

import SwiftUI

struct ProgramDetail: View {
    var program: Program = Program(day: "Lundi", description: "Pecs", emoji: "🏋️", fullDescription: "Échauffement : 5 à 10 minutes de cardio léger \n\n Développé couché avec haltères : 4 séries de 8 à 12 répétitions \n\n Développé incliné avec haltères : 3 séries de 10 à 12 répétitions \n\n Écarté incliné avec haltères : 3 séries de 12 à 15 répétitions \n\n Pull-over avec haltère : 3 séries de 12 à 15 répétitions")
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 30 / 255, green: 36 / 255, blue: 50 / 255)
                VStack {
                    Spacer()
                    Text(program.day)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                    Text(program.description)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    Text(program.emoji)
                        .font(.largeTitle)
                    Spacer()
                    Text(program.fullDescription)
                        .foregroundColor(.white)
                        .font(.headline)
                    Spacer()
                }
                .padding()
                .foregroundColor(.black)
            }.ignoresSafeArea()
            
            NavigationLink {
                VisioView()
            } label: {
                Text("Commencer l'entraînement")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
            }
        }
    }
}

struct ProgramDetail_Previews: PreviewProvider {
    static var previews: some View {
        ProgramDetail()
    }
}
