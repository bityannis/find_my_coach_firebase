//
//  RegisterView.swift
//  FireBase
//
//  Created by Yannis Kessas on 28/03/2023.
//

import SwiftUI
import Firebase

struct RegisterView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var isActive: Bool = false
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let e = error {
                print(e)
            } else {
                print("success")
                isActive = true
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                CredentialView(value: $email, placeholder: "Email")
                CredentialView(value: $password, placeholder: "Password")
                
                NavigationLink(destination: TabViewDemo(), isActive: $isActive) {
                    Button("Register") {
                        register()
                    }.fontWeight(.bold).foregroundColor(.purple)
                }
            }
        }
    }
}




struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

struct CredentialView: View {
    @Binding var value: String
    var placeholder: String
    var body: some View {
        VStack {
            TextField(placeholder, text: $value).padding()
        }
        .background(Color(red: 0.698, green: 0.643, blue: 1.0))
        .cornerRadius(20)
        .padding()
    }
}
