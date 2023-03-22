//
//  ChatView.swift
//  FindMyCoach
//
//  Created by Yannis Kessas on 22/03/2023.
//

import SwiftUI

struct ChatView: View {
    var boomerMessage: String = "Hello, I would like to be like you"
    var chadMessage: String = "Yes"
    @State private var showingSheet = false
    
    
    var body: some View {
        ZStack {
            Color(.black)
            
            VStack(alignment: .leading) {
                Text("Coach Chad").font(.title).fontWeight(.bold).foregroundColor(.white).multilineTextAlignment(.center).offset(x: 1, y: -220)
                
                HStack(spacing: 12.0) {
                    Spacer()
                    Text(boomerMessage)
                        .padding(10)
                        .foregroundColor(.white)
                        .background(.blue)
                    .cornerRadius(10)
                    
                    Image("Boomer").resizable().frame(width: 30, height: 30).cornerRadius(50)
                }
                .offset(x: 1, y: -150)
                    
                
                HStack(spacing: 12.0) {
                    Image("GigachadImage").resizable().frame(width: 30, height: 30).cornerRadius(50)
                    
                    Text(chadMessage)
                        .padding(10)
                        .foregroundColor(.black)
                        .background(.white)
                    .cornerRadius(10)
                    
                }
                .offset(x: 1, y: -100)
                
                HStack {
                    Button {
                        showingSheet.toggle()
                    } label: {
                        Text("Coach Chad Offer you a special Training, click to continue").font(.body).fontWeight(.bold).multilineTextAlignment(.center).padding(10).foregroundColor(.white).background(.orange).cornerRadius(10)
                    }
                    .sheet(isPresented: $showingSheet) {
                        PaymentModal()
                    }
                
                }
                .padding(.top, 30.0)
            }
            
        }
        .ignoresSafeArea()
    }
    
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
