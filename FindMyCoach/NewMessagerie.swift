//
//  NewMessagerie.swift
//  FindMyCoach
//
//  Created by Yannis Kessas on 27/03/2023.
//

import SwiftUI

struct NewMessagerie: View {
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                List(person){ personne in
                    VStack(alignment: .leading){
                        
                        Text(personne.category)
                            .foregroundColor(.blue)
                        
                        NavigationLink{
                            //Redirection vers Chat
                            ChatView()
                        } label: {
                            VStack(alignment: .leading){
                                
                                HStack{
                                    
                                    Image(personne.logo)
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .cornerRadius(25)
                                        .padding(5)
                                    
                                    Text(personne.name)
                                        .font(.title2)
                                        .bold()
                                }
                            }
                        }
                    }
                }.navigationTitle("Messages")
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
    Mess(name: "Chad", logo: "GigachadImage", category: "Coach"),
    Mess(name: "BlondChad", logo: "BlondChad", category: "Amis"),
    Mess(name: "Bryan", logo: "BrianShawImage", category: "Amis")
]
