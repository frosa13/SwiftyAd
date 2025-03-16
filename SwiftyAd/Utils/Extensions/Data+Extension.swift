//
//  Data+Extension.swift
//  SwiftyAd
//
//  Created by Francisco Rosa on 15/03/2025.
//

import Foundation

extension Data {
    func printAsJSON() {
        guard let json = try? JSONSerialization.jsonObject(with: self, options: .mutableContainers),
              let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) else {
            print("JSON decode error")
            return
        }
        
        print(String(decoding: jsonData, as: UTF8.self))
    }
}
