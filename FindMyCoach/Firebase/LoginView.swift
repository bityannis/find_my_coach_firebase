//
//  LoginView.swift
//  FireBase
//
//  Created by Yannis Kessas on 28/03/2023.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @State var email: String = "Gerard@mdp.com"
    @State var password: String = "123456"
    @State var isLogin: Bool = false
    @State var errorMessage: String = ""
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let e = error {
                print(e)
                errorMessage = String(e.localizedDescription)
            } else {
                print("success")
                isLogin = true
            }
        }
    }
    var body: some View {
        VStack {
            CredentialView(value: $email, placeholder: "Username")
            CredentialView(value: $password, placeholder: "Password")
            
            NavigationLink(destination: TabViewDemo(), isActive: $isLogin) {
                Button("Login") {
                    login()
                }.fontWeight(.bold).foregroundColor(.purple)
            }
            
            Text(errorMessage)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
