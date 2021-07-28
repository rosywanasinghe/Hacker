//
//  NetworkManager.swift
//  H4X0R News
//
//  Created by Rosy Wanasinghe on 26/7/21.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
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

// Observable object means that NetworkManager class can broadcast one or more of its properties
// @Published means that posts is a property that can be broadcasted, and it notifies the listener when it has been changed
// Need DispatchQueue because the updating of posts is being listened to (as it is published) and needs to occur on the main thread
