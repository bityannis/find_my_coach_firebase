//
//  NetworkManager.swift
//  FindMyCoach
//
//  Created by Yannis Kessas on 27/03/2023.
//

import SwiftUI

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=story&query=nutrition&numericFilters=created_at_i%3E=1616582400&hitsPerPage=5") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                           let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}

struct Results: Decodable {
    let hits: [Post]
}

