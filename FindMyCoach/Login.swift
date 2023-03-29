//
//  Login.swift
//  FindMyCoach
//
//  Created by Yannis Kessas on 23/03/2023.
//

import SwiftUI

struct Login: View {
    var realUsername = "Gg"
    var realPassword = "123"
    @State private var username = ""
    @State private var password = ""
    @State var sentence = ["Bonjour Gérard" ,"Mot de passe ou nom d'utilisateur invalide", "Nom d'utilisateur vide"]
    @State var i: Int = 0
    @State var connectedViewIsActive = false
    
    func validateCredentials() {
        if username.isEmpty {
            i = 2
        } else if username == realUsername && password == realPassword {
            connectedViewIsActive = true
        } else {
            i = 1
        }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                DynamicGradient()
                VStack {
                    Text("FIND MY COACH").font(Font.custom("Kanit-ExtraBold", size: 50.0)).fontWeight(.bold).foregroundColor(Color.white).multilineTextAlignment(.center).padding(50)
                    Spacer()
                    Text(sentence[i])
                        .font(.title)
                        .fontWeight(.semibold).foregroundColor(Color.black)
                    
                    HStack {
                        Text("Nom d'utilisateur")
                        TextField("Tapez ici", text: $username)
                    }
                    HStack {
                        Text("Mot de passe      ")
                        SecureField("Tapez ici", text: $password)
                    }
                    
                    Button(action: {
                        validateCredentials()
                    }) {
                        Text("Se connecter").frame(width: 150, height: 50).background(.black).cornerRadius(10).foregroundColor(.white).fontWeight(.bold)
                    }
                    
                    NavigationLink(
                        destination: TabViewDemo(),
                        isActive: $connectedViewIsActive
                    ) {
                        EmptyView()
                    }
                    Spacer()
                }
                .padding()
            }.ignoresSafeArea()
        }
    }
}


struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
