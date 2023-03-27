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
            VStack {
                HStack {
                    Text("Tableau des objectifs")
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
                .padding()

                Text("Graphique des objectifs")
                    .font(.title)
                    .padding()

                BarChartView(data: goals)
                    .padding()
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
