//
//  DetailView.swift
//  H4X0R News
//
//  Created by Rosy Wanasinghe on 26/7/21.
//

import SwiftUI

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}


// Need a WebView to display a website that's separate from the browser
// After the NavigationLink is clicked from the homepage, it will take the user to the DetailView, which then loads up the WebView, taking the user to the article webpage
