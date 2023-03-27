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
//                Color(.orange)
                VStack(alignment: .leading){
                    Text(Date.now, format: .dateTime.day().month().year());
                    Text("Sommaire")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    //VStack de l'affichage global
                    VStack(alignment: .leading){
                        
                        //Mise en page de l'actualité
                        Text("Actualité")
                            .padding(5)
                        NavigationLink {
                            ActualityView()
                        } label : {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.gray)
                                    .frame(width: 360, height: 150)
                                    .cornerRadius(20)
                                
                                VStack {
                                    HStack{
                                        //Mettre "Logo" des amis via une struct
                                        Image(systemName: "person.circle.fill")
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                        
                                        
                                        VStack{
                                            //Mettre les phrases via la struct
                                            Text("Votre Ami a débloquer le badge course 10 Kilomètre")
                                        }
                                    }
                                    HStack{
                                        //Mettre "Logo" des amis via une struct
                                        Image(systemName: "person.circle.fill")
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                        
                                        
                                        VStack{
                                            //Mettre les phrases via la struct
                                            Text("Votre Ami a débloquer le badge course 10 Kilomètre")
                                        }
                                    }
                                }
                            }.foregroundColor(.black)
                        }
                        //Fin d'actu
                        //Mise en page des Badges et Planning
                        
                        Text("Badges")
                        
                        HStack {
                            ZStack {
                                NavigationLink {
                                    BadgesView()
                                } label: {
    //                                Rectangle()
    //                                    .foregroundColor(.gray)
    //                                    .frame(width: 230, height: 90)
    //                                    .cornerRadius(20)
                                    
                                    HStack{
                                        //Récupéré les defis réussi pour remplacer les cercles
                                        Circle()
                                            .frame(height: 60)
                                        Circle()
                                            .frame(height: 60)
                                        Circle()
                                            .frame(height: 60)
                                    }
                                }
                           
                            }.foregroundColor(.black)
                            Spacer()
//                            ZStack{
//                                NavigationLink {
//                                    ProgramView()
//                                } label: {
//
//                                    Image(systemName: "calendar")
//                                        .resizable()
//                                        .frame(width: 60, height: 60)
//                                }
//
//                            }.foregroundColor(.black)
                        }//Fin de mise en page
                        //Mise en page Conseils
                        Spacer()
                        Text("Conseils")
                        ZStack{
                            Rectangle()
                                .foregroundColor(.gray)
                                .frame(width: 360, height: 110)
                                .cornerRadius(20)
                            
                            VStack(alignment: .center){
                                Text("Pour réussir votre objectif Hebdomadaire nous vous conseillons")
                                    .padding()
                            }
                        }//Fin mise en pages
                        Spacer()
                        //Mise en page de progression
                        Text("Progression")
                        ZStack{
                            NavigationLink {
                                ProgressionView()
                            } label: {
                                HStack {
    //                                Circle()
    //                                    .frame(height: 70)
                                    Image(systemName: "star.fill").resizable().frame(width: 50, height: 50)
                                    Text("Vous êtes a 67% de votre objectif")
                                }
                            }
                        }.foregroundColor(.black)
                    }
                    .padding()
                    Spacer()
                }
            }
            ///
        }
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


