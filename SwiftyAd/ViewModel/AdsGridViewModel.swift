//
//  AdsGridViewModel.swift
//  SwiftyAd
//
//  Created by Francisco Rosa on 15/03/2025.
//

import SwiftUI

class AdsGridViewModel: ObservableObject {
    var ads: [Ad]
    @Binding var isLoading: Bool
    var adSelectedAction: ((Ad) -> Void)?
    
    init(ads: [Ad], isLoading: Binding<Bool>, adSelectedAction: ((Ad) -> Void)?) {
        self.ads = ads
        self._isLoading = isLoading
        self.adSelectedAction = adSelectedAction
    }
}
