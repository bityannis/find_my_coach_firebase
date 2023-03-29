//
//  ActualityView.swift
//  FindMyCoach
//
//  Created by Yannis Kessas on 27/03/2023.
//

import SwiftUI

struct ActualityView: View {
    @State private var value: Int = 0
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 30 / 255, green: 36 / 255, blue: 50 / 255)
                
                VStack(alignment:.leading) {
                    Text("Actualités")
                        .offset(x:1 , y:-30)
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                ZStack{
                     RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(.gray)
                        .frame(width: 360, height: 150)
                        .offset(x: 10, y:-0)
                    
                        
                    VStack(alignment: .leading){
                            
                        Text("👱🏻‍♂️ Dimitri a réussis son premier marathon")
                            .padding(.horizontal, 15)
                        Text("👳🏻‍♂️ Abdallah a battu son record de pompes")
                            .padding(.horizontal, 15)
                        
                    }.fontWeight(.bold)
                    }
                    NavigationLink {
                        ArticlesList()
                    } label: {
                        VStack {
                            Text("Actus sports & nutrition")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(30)
                            .foregroundColor(.white)
                            Image(systemName: "hand.tap.fill", variableValue: (Double(value) / 100)).resizable().frame(width: 50, height: 50).foregroundColor(.orange)
                        }
                        
                    }
                    
                    VStack (alignment:.leading) {
                        
                        Text("Badges de mes amis")
                            .offset(x: -40, y:20)
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                            .padding(60)
                    }

                    HStack{
                        ZStack{
                            Circle()
                                .frame(width: 90, height: 90)
                                .padding()
                                .offset(x: 1, y:-20)
                            
                            Menu("\(Image(systemName: "figure.run"))"){
                                Button("Vos amis ont débloqué le badge course, Bien joué !", action: click)
                            }
                            .foregroundColor(.green)
                            .font(.title)
                            .offset(x: 1, y:-20)

                        }
                        HStack{
                            ZStack{
                                Circle()
                                    .frame(width: 90, height: 90)
                                    .padding()
                                    .offset(x: 1, y:-20)
                                
                                Menu("\(Image(systemName: "figure.strengthtraining.traditional"))"){
                                    Button("Vos amis ont débloqué le badge Soulever de terre, Bien joué !", action: click)
                                }
                                .foregroundColor(.green)
                                .font(.title)
                                .offset(x: 1, y:-20)

                            }
                        }
                        HStack{
                            ZStack{
                                Circle()
                                    .frame(width: 90, height: 90)
                                    .padding()
                                    .offset(x: 1, y:-20)
                                
                                Menu("\(Image(systemName: "figure.boxing"))"){
                                    Button("Vos amis ont débloqué le badge Box, Bien joué !", action: click)
                                }
                                .foregroundColor(.green)
                                .font(.title)
                                .offset(x: 1, y:-20)
                            }
                        }
                    }
                }
                
            }
            .ignoresSafeArea()
        }
    }
}
struct ActualityView_Previews: PreviewProvider {
    static var previews: some View {
        ActualityView()
    }
}

