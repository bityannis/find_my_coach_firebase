//
//  SwiftUIView.swift
//  FindMyCoach
//
//  Created by Yannis Kessas on 22/03/2023.
//

import SwiftUI

struct VisioView: View {
    @State private var timerValue: Double = 5.0
    @State private var trainingDone: Bool = false
    var images: [String] = ["bubble.left.fill", "volume.3.fill", "mic.fill"]
    
    var body: some View {
        ZStack {
            Color(.orange)
            VStack {
//                HStack {
//                    Text("Share Play").frame(width: 300, height: 80).background(.gray).cornerRadius(10)
//                    Image("GigachadImage").resizable().frame(width: 50, height: 50).cornerRadius(50).offset(x: -300, y: 1)
//                    VStack {
//                        ForEach(0..<images.count) {
//                            Image(systemName: images[$0]).foregroundColor(.white)
//                        }
//                    }
//                }
//                .offset(x: 1, y: -100)
                
                ZStack {
                    Circle().trim(from: 0, to: timerValue*0.1*2).stroke(lineWidth: 10).foregroundColor(.gray)
                      
                    Text("\(Int(timerValue))")
                        .font(.largeTitle)
                        .padding().foregroundColor(.white)
                  }
                .padding()
                
                Button("Commencer l'entraînement") {
                    // Start the timer when the button is tapped
                    Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                        // Decrement the timer value by 1 every second
                        if self.timerValue > 0 {
                            self.timerValue -= 1
                        } else {
                            // Stop the timer when the timer value reaches 0
                            timer.invalidate()
                            trainingDone = true
                        }
                    }
                }
                .sheet(isPresented: $trainingDone) {
                    EndSessionModal()
                }

            }
            .padding()
        }
        .ignoresSafeArea()
    
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        VisioView()
    }
}
