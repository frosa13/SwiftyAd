//
//  UILabel+Extension.swift
//  SwiftyAd
//
//  Created by Francisco Rosa on 16/03/2025.
//

import UIKit

extension UILabel {
    convenience init(weight: UIFont.Weight? = .regular, size: CGFloat, color: UIColor? = nil, alignment: NSTextAlignment? = nil) {
        self.init()
        
        self.font = UIFont.systemFont(ofSize: size, weight: weight ?? .regular)
        self.numberOfLines = 0

        if let color = color { self.textColor = color }
        if let alignment = alignment { self.textAlignment = alignment }
    }
}
