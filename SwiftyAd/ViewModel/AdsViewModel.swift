//
//  AdsViewModel.swift
//  SwiftyAd
//
//  Created by Francisco Rosa on 15/03/2025.
//

import SwiftUI

@MainActor class AdsViewModel: ObservableObject {
    @Published var ads: [Ad] = []
    @Published private var adCategories: [AdCategory] = []
    @Published var isLoading = true
    @Published var error = false
    
    init() {
        Task {
            await loadAds()
        }
    }
    
    func loadAds() async {
        
        updateViewState(isLoading: true)
        
        if adCategories.isEmpty {
            await loadAdCategories()
        }
        
        guard let ads = await NetworkManager.shared.fetchAds() else {
            updateViewState(error: true)
            return
        }
              
        self.ads = ads.map { ad in
            var mutableAd = ad
            mutableAd.category = self.adCategories.first(where: { $0.id == ad.categoryID })
            return mutableAd
        }
        
        updateViewState()
    }
    
    private func loadAdCategories() async {
        guard let adCategories = await NetworkManager.shared.fetchAdCategories() else {
            return
        }
        
        DispatchQueue.main.async {
            self.adCategories = adCategories
        }
    }
    
    private func updateViewState(isLoading: Bool? = false, error: Bool? = false) {
        withAnimation {
            self.isLoading = isLoading ?? false
            self.error = error ?? false
        }
    }
}
