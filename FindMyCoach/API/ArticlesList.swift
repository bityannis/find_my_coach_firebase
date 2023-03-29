//
//  ArticlesList.swift
//  FindMyCoach
//
//  Created by Yannis Kessas on 27/03/2023.
//

import SwiftUI

struct ArticlesList: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                //                LinearGradient(gradient: Gradient(colors: [.white, .yellow, .orange]), startPoint: .top, endPoint: .bottom)
                Color(red: 30 / 255, green: 36 / 255, blue: 50 / 255)
                VStack {
                    ForEach(networkManager.posts) { post in
                        NavigationLink {
                            ArticleDetail(url: post.url)
                        } label: {
                            ZStack {
                                Rectangle()
                                    .frame(width: 400, height: 100)
                                    .foregroundColor(.black)
                                    .cornerRadius(20)
                                HStack {
                                    //                            Text("\(String(post.points)) points")
                                    Text(post.title)
                                        .padding(.horizontal, 10)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                }
                            }
                        }
                    }
                    .navigationTitle("Sport & nutrition")
                }
                .onAppear {
                    self.networkManager.fetchData()
                }
            }
        }
    }
}

struct ArticlesList_Previews: PreviewProvider {
    static var previews: some View {
        ArticlesList()
    }
}
