//
//  BadgesView.swift
//  FindMyCoach
//
//  Created by Tom Rizo on 28/03/2023.
//

import SwiftUI

struct BadgesView: View {
    var body: some View {
        ZStack {
            Color(red: 30 / 255, green: 36 / 255, blue: 50 / 255)
            
            VStack(alignment: .leading){
                Text("Badges")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .offset(x: 1, y: -30)
                
                Text("Badges à débloquer")
                    .font(.title2)
                    .foregroundColor(.white)
                    .offset(x: 20, y: -0)
                
                
                ExtractedView()
                    .foregroundColor(.black)
                ExtractedView()
                    .foregroundColor(.black)
                ExtractedView()
                    .foregroundColor(.black)
                
                
                Text("Badges débloqués")
                    .font(.title2)
                    .foregroundColor(.white)
                    .offset(x: 20, y:-0)
                
                HStack{
                    ZStack{
                        Circle()
                            .frame(width: 90, height: 90)
                            .padding()
                        
                        Menu("\(Image(systemName: "tennisball.fill"))"){
                            Button("Vous avez débloqué le badge tenis, Bien joué !", action: click)
                        }
                        .foregroundColor(.green)
                        .font(.title)
                    }
                    
                    ZStack{
                        Circle()
                            .frame(width: 90, height: 90)
                            .padding()
                        
                        Menu("\(Image(systemName: "basketball.fill"))"){
                            Button("Vous avez débloqué le badge basket, Bien joué !", action: click)
                        }
                        .foregroundColor(.green)
                        .font(.title)
                    }
                    
                    ZStack{
                        Circle()
                            .frame(width: 90, height: 90)
                            .padding()
                        
                        Menu("\(Image(systemName: "football.fill"))"){
                            Button("Vous avez débloqué le badge football, Bien joué !", action: click)
                        }
                        .foregroundColor(.green)
                        .font(.title)
                    }
                }
            }
        }.ignoresSafeArea()
    }
}

struct BadgesView_Previews: PreviewProvider {
    static var previews: some View {
        BadgesView()
    }
}

func click() { }

struct ExtractedView: View {
    var body: some View {
        HStack{
            ZStack{
                Circle()
                    .frame(width: 90, height: 90)
                    .padding()
                
                Menu("\(Image(systemName: "questionmark"))"){
                    Button("Vous n'avez pas débloqué ce badge", action: click)
                }
                .foregroundColor(.gray)
                .font(.largeTitle)
            }
            HStack{
                ZStack{
                    Circle()
                        .frame(width: 90, height: 90)
                        .padding()
                    
                    Menu("\(Image(systemName: "questionmark"))"){
                        Button("Vous n'avez pas débloqué ce badge", action: click)
                    }
                    .foregroundColor(.gray)
                    .font(.largeTitle)
                    
                }
            }
            HStack{
                ZStack{
                    Circle()
                        .frame(width: 90, height: 90)
                        .padding()
                    
                    Menu("\(Image(systemName: "questionmark"))"){
                        Button("Vous n'avez pas débloqué ce badge", action: click)
                    }
                    .foregroundColor(.gray)
                    .font(.largeTitle)
                    
                }
            }
        }
    }
}
