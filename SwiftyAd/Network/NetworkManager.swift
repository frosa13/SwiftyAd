//
//  NetworkManager.swift
//  SwiftyAd
//
//  Created by Francisco Rosa on 15/03/2025.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    func fetchAds() async -> [Ad]? {
        guard let url = URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/listing.json") else {
            return nil
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            data.printAsJSON()
            return try JSONDecoder().decode([Ad].self, from: data)
        } catch {
            print("Response: fetch ads failed with: \(error.localizedDescription)")
            return nil
        }
    }
    
    func fetchAdCategories() async -> [AdCategory]? {
        guard let url = URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/categories.json") else {
            return nil
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            data.printAsJSON()
            return try JSONDecoder().decode([AdCategory].self, from: data)
        } catch {
            print("Response: fetch ad categories failed with: \(error.localizedDescription)")
            return nil
        }
    }
}
