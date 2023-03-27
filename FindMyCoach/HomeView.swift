//
//  ContentView.swift
//  FMC
//
//  Created by Apprenant 24 on 21/03/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.white, .yellow, .orange]), startPoint: .top, endPoint: .bottom)
                
                VStack(alignment: .trailing){
                    VStack {
                        Text(Date.now, format: .dateTime.day().month().year()).padding(10)
//                        Text("Sommaire")
//                            .font(.largeTitle)
//                            .fontWeight(.bold)
//                            .padding(5)
                    }.padding(.top, 50.0)
                   
                    
                    //VStack de l'affichage global
                    VStack(alignment: .leading) {
                        
                        //Mise en page de l'actualité
                        Text("Actualité").font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(5)
                        NavigationLink {
                            ActualityView()
                        } label : {
                            ZStack {
                                ZStack {
                                    Color(.white)
                                    VStack {
                                        FriendFeed(sentence: "Dimitri a réussis son premier marathon", symbol: "dumbbell")
                                        FriendFeed(sentence: "Abdallah a battu son record de pompes", symbol: "person.fill")
                                        
                                    }
                                }.cornerRadius(10)
                            }.foregroundColor(.black)
                        }
                        
                        Text("Badges")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        HStack {
                            ZStack {
                                NavigationLink {
                                    BadgesView()
                                } label: {
                                    ZStack {
                                        Color(.white)
                                        HStack{
                                            //Récupéré les defis réussi pour remplacer les cercles
                                            Badge(color: .green, symbol: "dumbbell.fill")
                                            Badge(color: .green, symbol: "figure.disc.sports")
                                            Badge(color: .orange, symbol: "carrot")
                                            Badge(color: .blue, symbol: "figure.open.water.swim")
                                        }
                                    }.cornerRadius(10)
                                }
                                
                            }.foregroundColor(.black)
                            Spacer()
                        }
//                        Spacer()
//                        Text("Conseils")      .font(.largeTitle)
//                            .fontWeight(.bold)
//                        ZStack{
//                            ZStack {
//                                Color(.white)
//                                VStack(alignment: .center){
//                                    Text("Pour réussir votre objectif Hebdomadaire nous vous conseillons")
//                                        .padding()
//                                }
//                            }.cornerRadius(10)
//                        }
                        Spacer()
                        Text("Progression")      .font(.largeTitle)
                            .fontWeight(.bold)
                        ZStack{
                            NavigationLink {
                                ProgressionView()
                            } label: {
                                ZStack {
                                    Color(.white)
                                    HStack {
                                        Image(systemName: "star.fill").resizable().frame(width: 50, height: 50).foregroundColor(.yellow)
                                        
                                        Text("Vous êtes a 67% de votre objectif")
                                    }
                                }.cornerRadius(10)
                            }
                        }.foregroundColor(.black)
                    }
                    .padding()
                    Spacer()
                }
            }
            //
            .ignoresSafeArea()
            
        }
        
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}



struct Badge: View {
    var color: Color
    var symbol: String
    
    var body: some View {
        Circle().foregroundColor(color).frame(width: 60, height: 60).overlay(Image(systemName: symbol))
    }
}

struct FriendFeed: View {
    var sentence: String
    var symbol: String
    
    var body: some View {
        HStack{
            Image(systemName: symbol)
                .resizable()
                .frame(width: 30, height: 30)
            VStack{
                Text(sentence)
            }
        }
    }
}
