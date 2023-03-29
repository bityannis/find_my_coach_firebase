//
//  ProgressionView.swift
//  FindMyCoach
//
//  Created by Yannis Kessas on 24/03/2023.
//

import SwiftUI

var goals = [
    Goal(title: "Perte poids", value: 60),
    Goal(title: "P Muscles", value: 40),
    Goal(title: "Courir 1km", value: 80),
    Goal(title: "Iron Man", value: 20),
    Goal(title: "Cardio", value: 50)
]

struct ProgressionView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 30 / 255, green: 36 / 255, blue: 50 / 255)
                VStack {
                    HStack {
                        Text("Tableau des objectifs")
                            .foregroundColor(.white)
                            .font(.title)
                            .padding()
                        NavigationLink {
                            ObjectivesView()
                        } label: {
                            Image(systemName: "plus.app.fill").resizable().frame(width: 30, height: 30)
                        }
                    }
                    
                    List(goals) { goal in
                        HStack {
                            Text(goal.title)
                            Spacer()
                            Text("\(Int(goal.value)) %")
                                .foregroundColor(.gray)
                        }
                    }
                    .listStyle(PlainListStyle())
                    .padding()
                    
                    Text("Graphique des objectifs")
                        .font(.title)
                        .padding()
                        .foregroundColor(.white)
                    
                    BarChartView(data: goals)
                        .padding()
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct BarChartView: View {
    let data: [Goal]
    let maxValue: Double

    init(data: [Goal]) {
        self.data = data
        self.maxValue = data.map { $0.value }.max() ?? 100
    }

    var body: some View {
        HStack(alignment: .bottom, spacing: 10) {
            ForEach(data) { goal in
                VStack {
                    ZStack(alignment: .bottom) {
                        Capsule()
                            .fill(Color.gray)
                            .frame(width: 30, height: 230)
                        Capsule()
                            .fill(Color.blue)
                            .frame(width: 30, height: CGFloat(goal.value / maxValue) * 200)
                    }
                    Text(goal.title)
                        .font(.caption)
                }
            }
        }
    }
}

struct ProgressionView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressionView()
    }
}
