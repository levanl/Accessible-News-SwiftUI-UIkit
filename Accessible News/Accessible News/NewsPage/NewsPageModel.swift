//
//  NewsPageModel.swift
//  Accessible News
//
//  Created by Levan Loladze on 27.12.23.
//

import Foundation

// MARK: - NewsModel
struct NewsModel: Codable {
    let data: [Article]
}

// MARK: - Article
struct Article: Codable {
    let uuid, title, description: String
    let url: String
    let imageURL: String
    let categories: [String]
    
    enum CodingKeys: String, CodingKey {
        case uuid, title, description, url
        case imageURL = "image_url"
        case categories
    }
}
