//
//  EndSessionModal.swift
//  FindMyCoach
//
//  Created by Yannis Kessas on 22/03/2023.
//

import SwiftUI

struct EndSessionModal: View {
    @State private var pourcentage: Double = 20
    @State var  commentaires = ""
    var body: some View {
        
       
            ZStack (alignment: .center){
                
                RoundedRectangle(cornerRadius: 40)
                    .frame(width: 400, height: 900)
                    .foregroundColor(.black)
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 400, height: 700)
                    .foregroundColor(.gray)
                
                
                switch pourcentage{
                    
                case 0...20:
                    
                    Text(" ⭐️")
                case 20...40:
                    
                    Text("⭐️⭐️")
                case 40...60:
                    
                    Text("⭐️⭐️⭐️")
                case 60...80:
                    Text("⭐️⭐️⭐️⭐️")
                    
                case 80...100:
                    
                    Text("⭐️⭐️⭐️⭐️⭐️")
                default:
                    Color.black
                    
                }
                
                VStack (alignment: .center) {
                    
                    Text("\(Int(pourcentage))%")
                    
                    
                    Slider(value: $pourcentage, in: 0...100)
                    HStack (alignment: .top) {
                        Text("Donnez votre avis sur votre séance !")
                            .font(.title2)
                            .offset(x: 10, y: -300)
                            .padding()
                        
                        
                    }
                    .padding()
                }
                ZStack (alignment: .leading){
                    
                    
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: 400, height: 350)
                        .foregroundColor(.white)
                        .offset(x: 60, y: 200)
                    ZStack {
                        Text("N'hesiter pas à laisser un commentaire :")
                            .offset(x: -20, y: 60)
                        TextEditor(text: $commentaires)
                            .padding()
                            .foregroundColor(Color.black)
                            .font(Font.custom("AvenirNext-Regular", size: 15, relativeTo: .body))
                            .frame(width: 360, height: 260)
                            .cornerRadius(30)
                            .scaledToFit()
                            .offset(x: 0 , y: 200)
                            .lineSpacing(10)
                            .padding(80)
                        
                    }
                }
            }
        }
    }
    
    struct EndSessionModal_Previews: PreviewProvider {
        static var previews: some View {
            EndSessionModal()
        }
    }

