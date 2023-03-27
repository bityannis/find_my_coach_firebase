//
//  ArticleDetail.swift
//  FindMyCoach
//
//  Created by Yannis Kessas on 27/03/2023.
//


import SwiftUI
import WebKit

struct ArticleDetail: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct ArticleDetail_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetail(url: "https://www.google.com")
    }
}
