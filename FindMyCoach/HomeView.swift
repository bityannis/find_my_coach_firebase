//
//  ContentView.swift
//  FMC
//
//  Created by Apprenant 24 on 21/03/2023.
//

import SwiftUI
import Firebase

struct HomeView: View {
    @State var isLoggedOut: Bool = false
    
    func logOut() {
        do {
            try Auth.auth().signOut()
            isLoggedOut = true
            print("logged out successfully")
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 30 / 255, green: 36 / 255, blue: 50 / 255)

                VStack(alignment: .trailing){
                    HStack {
                        Text(Date.now, format: .dateTime.day().month().year()).fontWeight(.bold).padding(10).foregroundColor(.white)
                        HStack {
                            NavigationLink(destination: WelcomeView().navigationBarHidden(true), isActive: $isLoggedOut) {
                                Button("Log Out") {
                                    logOut()
                                }.fontWeight(.bold).foregroundColor(.purple)
                            }
                        }.padding()
//                        Text("Sommaire")
//                            .font(.largeTitle)
//                            .fontWeight(.bold)
//                            .padding(5)
                    }.padding(.top, 50.0)
                   
                    
                    //VStack de l'affichage global
                    VStack(alignment: .leading) {
                        
                        //Mise en page de l'actualité
                        Text("Actualité").font(.largeTitle).foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(5)
                        NavigationLink {
                            ActualityView()
                        } label : {
                            ZStack {
                                ZStack {
                                    VStack {
                                        FriendFeed(sentence: "Dimitri a réussis son premier marathon", symbol: "figure.run")
                                        FriendFeed(sentence: "Abdallah a battu son record de pompes", symbol: "figure.stand")
                                        
                                    }
                                }
                            }.foregroundColor(.black)
                        }
                        Spacer()
                        Text("Badges").foregroundColor(.white)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        HStack {
                            ZStack{
                                NavigationLink {
                                    BadgesView()
                                } label: {
                                    ZStack(alignment: .leading){
                                        
                                        HStack{
                                            //Récupéré les defis réussi pour remplacer les cercles
                                            Badge(color: .green, symbol: "dumbbell.fill")
                                            Badge(color: .green, symbol: "figure.disc.sports")
                                            Badge(color: .orange, symbol: "carrot")
                                            Badge(color: .blue, symbol: "figure.open.water.swim")
                                        }
                                    }.cornerRadius(20)
                                }
                                
                            }.foregroundColor(.black)
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
                        Text("Progression").font(.largeTitle)
                            .fontWeight(.bold).foregroundColor(.white)
                        
                        ZStack{
                            NavigationLink {
                                ProgressionView()
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 350, height: 100).cornerRadius(20)
                                    HStack {
                                        Image(systemName: "star.fill").resizable().frame(width: 50, height: 50).foregroundColor(.orange)
                                        
                                        Text("Vous êtes a 67% de votre objectif")
                                            .font(.title2)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                        }.foregroundColor(.black)
                        Spacer()
                        Spacer()
                    }
                }.padding()
            }.ignoresSafeArea()
//                .navigationBarHidden(true)
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
        ZStack{
            Rectangle()
                .frame(width: 80, height: 100).cornerRadius(20)
            Circle().foregroundColor(color).frame(width: 60, height: 60).overlay(Image(systemName: symbol))
        }
    }
}

struct FriendFeed: View {
    var sentence: String
    var symbol: String
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 350, height: 40).cornerRadius(15)
        
            HStack{
                Image(systemName: symbol)
                    .foregroundColor(.orange)
                
                VStack{
                    Text(sentence)
                        .foregroundColor(.white)
                    
                }
            }
        }
    }
}

