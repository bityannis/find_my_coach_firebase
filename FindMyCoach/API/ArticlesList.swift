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
            VStack {
                List(networkManager.posts) { post in
                    NavigationLink {
                        ArticleDetail(url: post.url)
                    } label: {
                        HStack {
//                            Text("\(String(post.points)) points")
                            Text(post.title).fontWeight(.bold)
                        }
                    }
                }
                .navigationTitle("Sport News")
            }
            .onAppear {
                self.networkManager.fetchData()
            }
        }
    }
}

struct ArticlesList_Previews: PreviewProvider {
    static var previews: some View {
        ArticlesList()
    }
}
