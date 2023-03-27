//
//  BadgesView.swift
//  FindMyCoach
//
//  Created by Yannis Kessas on 24/03/2023.
//

import SwiftUI

struct BadgesView: View {
    var body: some View {
        VStack(alignment: .leading){
            
            Text("Badges")
                .font(.largeTitle)
                .offset(x: 1, y: -60)
            
            Text("Badges à débloquer")
                .font(.title2)
                .offset(x: 20, y: -0)
            ZStack{
            ExtractedView()
                .foregroundColor(.black)
                

              
                   
            }
            ZStack{
                ExtractedView()
                    .foregroundColor(.black)
            
                   
            }
            ZStack{
                ExtractedView()
                    .foregroundColor(.black)
                
                    
            }
            VStack {
                Text("Badges débloqués")
                    .font(.title2)
                    .offset(x: 20, y:-0)
                }
            HStack{
                ZStack{
                    Circle()
                        .frame(width: 90, height: 90)
                        .padding()
                    
                    Image(systemName: "tennisball.fill")
                        .foregroundColor(.green)
                        .font(.title)

                }
                HStack{
                    ZStack{
                        Circle()
                            .frame(width: 90, height: 90)
                            .padding()
                        
                        Image(systemName: "basketball.fill")
                            .foregroundColor(.green)
                            .font(.title)

                    }
                }
                HStack{
                    ZStack{
                        Circle()
                            .frame(width: 90, height: 90)
                            .padding()
                        
                        Image(systemName: "football.fill")
                            .foregroundColor(.green)
                            .font(.title)
                    }
                }
            }

      }
   }
}

      

struct BadgesView_Previews: PreviewProvider {
    static var previews: some View {
        BadgesView()
    }
}



struct ExtractedView: View {
    var body: some View {
        HStack{
            ZStack{
                Circle()
                    .frame(width: 90, height: 90)
                    .padding()
                
                Image(systemName: "questionmark")
                    .foregroundColor(.gray)
                    .font(.title)
                    
                

            }
            HStack{
                ZStack{
                    Circle()
                        .frame(width: 90, height: 90)
                        .padding()
                    
                    Image(systemName: "questionmark")
                        .foregroundColor(.gray)
                        .font(.title)

                }
            }
            HStack{
                ZStack{
                    Circle()
                        .frame(width: 90, height: 90)
                        .padding()
                    
                    Image(systemName: "questionmark")
                    .foregroundColor(.gray)
                    .font(.title)

                }
            }
        }

        
    }
}
