//
//  WelcomeView.swift
//  FindMyCoach
//
//  Created by Yannis Kessas on 29/03/2023.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                DynamicGradient()
                VStack {
                    Spacer()
                    Text("FIND MY COACH").font(Font.custom("Kanit-ExtraBold", size: 50.0)).fontWeight(.bold).foregroundColor(Color.white).multilineTextAlignment(.center).padding(50)
                    Spacer()
                
                    NavigationLink {
                        RegisterView()
                    } label: {
                        Text("Register").font(.title).fontWeight(.bold).foregroundColor(.black)
                    }
                    NavigationLink {
                        LoginView()
                    } label: {
                        Text("Login").font(.title).fontWeight(.bold).foregroundColor(.white)
                    }
                }
                .padding()
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
