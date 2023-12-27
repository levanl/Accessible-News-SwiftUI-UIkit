//
//  NewsPageViewModel.swift
//  Accessible News
//
//  Created by Levan Loladze on 27.12.23.
//

import SwiftUI
import NetworkingPackageGeneric

// MARK: - ViewModel
final class NewsPageViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var articles: [Article] = []
    
    init() {
        fetchNews()
    }
    
    // MARK: - Fetch Product
    func fetchNews() {
        let urlString = ApiDetails.newsEndpoint
        
        NetworkManager.fetchData(from: urlString, modelType: NewsModel.self) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.articles = data.data
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}


// MARK: - Constant Api Details
struct ApiDetails {
    static var key = "WJEvT19eUH5wUxJKgKQKzZRJ78VFKmTnTWYYPGdI"
    static var newsEndpoint = "https://api.thenewsapi.com/v1/news/top?api_token=\(key)&locale=us&limit=10#"
}
