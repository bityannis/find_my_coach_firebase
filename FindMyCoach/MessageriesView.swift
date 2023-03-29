//
//  NewMessagerie.swift
//  FindMyCoach
//
//  Created by Yannis Kessas on 27/03/2023.
//

import SwiftUI

struct NewMessagerie: View {
//    init() {
//        //UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(.white)]
//    }
    var body: some View {
        NavigationStack{
            ZStack{
                Color(red: 30 / 255, green: 36 / 255, blue: 50 / 255)
                    .edgesIgnoringSafeArea(.top)

                ScrollView {
                    VStack(alignment: .leading){
                        
                        ForEach(person){ personne in
                            VStack(alignment: .leading){
                                Text(personne.category)
                                    .foregroundColor(.blue)
                                
                                NavigationLink{
                                    //Redirection vers Chat
                                    ChatView()
                                } label: {
                                    VStack{
                                        ZStack(alignment: .leading){
                                            Rectangle()
                                                .frame(width: 350, height: 100)
                                                .cornerRadius(20)
                                                .foregroundColor(.black)
                                        
                                            HStack{
                                                Image(personne.logo)
                                                    .resizable()
                                                    .frame(width: 50, height: 50)
                                                    .cornerRadius(25)
                                                
                                                Text(personne.name)
                                                    .font(.title2)
                                                    .bold()
                                                    .foregroundColor(.white)
                                                
                                            }.padding(.horizontal, 15)
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal, 15)
                            Divider()
                                .overlay(.white)
                        }
                    }
                }
                .navigationTitle("Messages")
                    .navigationBarTitleDisplayMode(.large)
            }
         
        }
    }
}

struct NewMessagerie_Previews: PreviewProvider {
    static var previews: some View {
        NewMessagerie()
    }
}


struct Mess: Identifiable {
    var id = UUID()
    var name:String
    var logo:String
    var category:String
    
}


var person = [
    Mess(name: "Ernest Khalimov", logo: "GigachadImage", category: "Coach"),
    Mess(name: "BlondChad", logo: "BlondChad", category: "Amis"),
    Mess(name: "Bryan", logo: "BrianShawImage", category: "Amis")
]
