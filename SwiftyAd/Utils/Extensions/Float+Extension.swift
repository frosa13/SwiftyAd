//
//  Float+Extension.swift
//  SwiftyAd
//
//  Created by Francisco Rosa on 15/03/2025.
//

import Foundation

extension Float {
    func formattedPrice() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = self.truncatingRemainder(dividingBy: 1) == 0 ? 0 : 2
        formatter.maximumFractionDigits = 2
        formatter.groupingSeparator = " "
        formatter.decimalSeparator = ","
        
        if let formattedString = formatter.string(from: NSNumber(value: self)) {
            return "\(formattedString)€"
        } else {
            return "\(self)€"
        }
    }
}
