//
//  WebView.swift
//  H4X0R News
//
//  Created by Rosy Wanasinghe on 26/7/21.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        } 
    }
}

// UIViewRepresentable allows us to create a UIView which represents a UIKitView; the two methods are the two methods needed for that protocol

