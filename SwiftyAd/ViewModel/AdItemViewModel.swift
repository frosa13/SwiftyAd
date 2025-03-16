//
//  AdItemViewModel.swift
//  SwiftyAd
//
//  Created by Francisco Rosa on 15/03/2025.
//

import SwiftUI

class AdItemViewModel: ObservableObject {
    @Published var ad: Ad
    var itemWidth: CGFloat
    
    init(ad: Ad, itemWidth: CGFloat) {
        self.ad = ad
        self.itemWidth = itemWidth
    }
}
