//
//  ContentView.swift
//  H4X0R News
//
//  Created by Rosy Wanasinghe on 26/7/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) {  post in
                NavigationLink(
                    destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
                
            }
            .navigationTitle("H4X0R News")
        }
        .onAppear(perform: {
            self.networkManager.fetchData()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


// List is equivalent to tableview
// NavigationView adds top bar to navigate back to original page
// ObservedObject means that ContentView is always listening out for changes in networkManager; whenever networkManager changes, it will update List
// NavigationLink creates a button that triggers a presentation to the DetailView when pressed (destination) and also makes the HStack with the title + points the label
