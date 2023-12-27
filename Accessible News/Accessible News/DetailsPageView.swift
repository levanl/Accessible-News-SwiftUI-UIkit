//
//  DetailsPageView.swift
//  Accessible News
//
//  Created by Levan Loladze on 27.12.23.
//

import SwiftUI

struct DetailsPageView: View {
    var newsItem: Article?
    
    var body: some View {
        if let newsItem = newsItem {
            Text("Details for \(newsItem.title)")
            
        } else {
            Text("No news item selected")
        }
    }
}


#Preview {
    DetailsPageView()
}
