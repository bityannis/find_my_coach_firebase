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
    @State var sentence = ["Bonjour Gérard" ,"Invalid credential", "Username is empty"]
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
            VStack {
                Text("FIND MY COACH").font(.largeTitle).fontWeight(.bold).foregroundColor(Color.orange)
                Spacer()
                Text(sentence[i])
                    .font(.title)
                    .fontWeight(.bold)
                
                HStack {
                    Text("Username")
                    TextField("Type here", text: $username)
                }
                HStack {
                    Text("Password")
                    SecureField("Type here", text: $password)
                }
                
                Button(action: {
                    validateCredentials()
                }) {
                    Text("Login").frame(width: 150, height: 50).background(.orange).cornerRadius(10).foregroundColor(.white).fontWeight(.bold)
                }
                
                NavigationLink(
                    destination: TabViewDemo(),
                    isActive: $connectedViewIsActive
                ) {
                    EmptyView()
                }
                Spacer()
            }
        }
    }
}


struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
