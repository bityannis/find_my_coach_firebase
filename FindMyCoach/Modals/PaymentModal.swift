//
//  PaymentModal.swift
//  FindMyCoach
//
//  Created by Yannis Kessas on 22/03/2023.
//

import SwiftUI

struct PaymentModal: View {
    var body: some View {
        ZStack {
            Color(.orange)
            VStack {
                Image("GigachadImage").resizable().frame(width: 150, height: 150).cornerRadius(50).offset(x: 1, y: -250)
                
                Text("Pay with \(Image(systemName: "apple.logo")) Pay").font(.body).fontWeight(.bold).multilineTextAlignment(.center).padding(10).foregroundColor(.black).background(.white).cornerRadius(10)
            }
        }
        .ignoresSafeArea()
    }
}

struct PaymentModal_Previews: PreviewProvider {
    static var previews: some View {
        PaymentModal()
    }
}
