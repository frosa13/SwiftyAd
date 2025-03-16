//
//  Ad.swift
//  SwiftyAd
//
//  Created by Francisco Rosa on 15/03/2025.
//

import Foundation

struct Ad: Codable, Identifiable, Hashable {
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title
        case categoryID = "category_id"
        case creationDate = "creation_date"
        case description
        case imagesURL = "images_url"
        case isUrgent = "is_urgent"
        case price
        case siret
    }
    
    let id: Int
    let title: String
    let categoryID: Int
    let creationDate: String
    let description: String
    let imagesURL: ImagesURL
    let isUrgent: Bool
    let price: Float
    var siret: String?
    var category: AdCategory?
}

struct ImagesURL: Codable, Hashable  {
    let small: String?
    let thumb: String?
}
