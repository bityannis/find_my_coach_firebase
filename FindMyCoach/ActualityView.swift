//
//  ActualityView.swift
//  FindMyCoach
//
//  Created by Yannis Kessas on 27/03/2023.
//

import SwiftUI

struct ActualityView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment:.leading) {
                Text("Actualité")
                    .offset(x:1 , y:-30)
                    .font(.title)
                    .bold()
                    .padding()
            ZStack{
                 RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(.gray)
                    .frame(width: 360, height: 150)
                    .offset(x: 10, y:-0)
                
                    
                    VStack{
                        
                    Text(" 🙍🏻‍♂️ Votre Ami a débloquer le badge course 10 Kilomètre")
                            .offset(x: 10, y:-0)
                    .padding(2)
                    Text("🙍🏽‍♀️ Votre Ami viens de faire son premier entraînement ")
                            .offset(x: 1, y:-0)
                    .padding(2)
                    }
                }
                NavigationLink {
                    ArticlesList()
                } label: {
                    Text("Nouvelles sportives")
                        .font(.title)
                        .fontWeight(.bold)
                        .background(.yellow)
                        .padding(30)
                }
                
                VStack (alignment:.leading) {
                    
                    Text("Badges de mes amis")
                        .offset(x: -40, y:20)
                        .font(.title2)
                        .bold()
                        .padding(60)
                }

                HStack{
                    ZStack{
                        Circle()
                            .frame(width: 90, height: 90)
                            .padding()
                            .offset(x: 1, y:-20)
                        
                        Image(systemName: "figure.run")
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
                            
                            Image(systemName: "figure.strengthtraining.traditional")
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
                            
                            Image(systemName: "figure.boxing")
                                .foregroundColor(.green)
                                .font(.title)
                                .offset(x: 1, y:-20)
                        }
                    }
                }
                    
                    
                    
                   
            }
        }
    }
}
struct ActualityView_Previews: PreviewProvider {
    static var previews: some View {
        ActualityView()
    }
}

