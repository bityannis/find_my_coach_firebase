//
//  DynamicGradient.swift
//  FindMyCoach
//
//  Created by Yannis Kessas on 27/03/2023.
//

import SwiftUI

struct DynamicGradient: View {
    var body: some View {
        AnimatedBackground().edgesIgnoringSafeArea(.all)
            .blur(radius: 50)
    }
}

struct AnimatedBackground: View {
    @State var start = UnitPoint(x: 0, y: -2)
    @State var end = UnitPoint(x: 4, y: 0)
    
    let timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
    let colors = [Color.red, Color.purple, Color.blue, Color.pink, Color.yellow, Color.orange]
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: colors), startPoint: start, endPoint: end)
            .animation(Animation.easeInOut(duration: 2).repeatForever())
            .onReceive(timer, perform: { _ in
                
                self.start = UnitPoint(x: 4, y: 0)
                self.end = UnitPoint(x: 0, y: 2)
                self.start = UnitPoint(x: -4, y: 20)
                self.start = UnitPoint(x: 4, y: 0)
            })
    }
}


struct DynamicGradient_Previews: PreviewProvider {
    static var previews: some View {
        DynamicGradient()
    }
}
