//
//  MockData.swift
//  SwiftyAdTests
//
//  Created by Francisco Rosa on 16/03/2025.
//

import Foundation

let adsData = """
[
    {
        "id": 1,
        "title": "Ad 1",
        "category_id": 1,
        "price": 100,
        "description": "Test ad",
        "images_url": {
            "small": "https://smallImage.png",
            "thumb": "https://thumbImage.png"
        },
        "creation_date": "2022-10-10T10:00:00Z",
        "is_urgent": false
    }
]
""".data(using: .utf8)

let adsCategoriesData = """
[
    {
        "id": 1,
        "name": "Category 1"
    }
]
""".data(using: .utf8)
