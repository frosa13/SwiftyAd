//
//  AdsGridView.swift
//  SwiftyAd
//
//  Created by Francisco Rosa on 15/03/2025.
//

import SwiftUI

struct AdsGridView: View {
    
    private enum Constants {
        static let loadingShimmerHeight: CGFloat = 250
    }
    
    var viewModel: AdsGridViewModel
    @State var animate: Bool = false
    
    var gridItemWidth: CGFloat {
        let numberOfColumns = Int(screenWidth / Size.s150.rawValue)
        let spacingSum = Margin.m4.rawValue + (Margin.m8.rawValue * CGFloat(numberOfColumns - 1))
        return (screenWidth - spacingSum) /  CGFloat(numberOfColumns)
    }
    
    var columns: [GridItem] = [
        GridItem(.adaptive(minimum: Size.s150.rawValue))
    ]
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                LazyVGrid(columns: columns, spacing: 8) {
                    ForEach(0..<10, id: \.self) { _ in
                        RoundedRectangle(cornerRadius: Radius.r8.rawValue)
                            .fill(Color.gray.opacity(0.3))
                            .frame(height: Constants.loadingShimmerHeight)
                            .overlay(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color.gray.opacity(0.2),
                                        Color.white.opacity(0.4),
                                        Color.gray.opacity(0.2)
                                    ]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                                .rotationEffect(.degrees(0))
                                .offset(x: animate ? gridItemWidth : -gridItemWidth)
                                .animation(Animation.easeInOut(duration: 0.5).delay(0.7).repeatForever(autoreverses: false), value: animate)
                                .clipped()
                            )
                            .onAppear {
                                animate = true
                            }
                    }
                }
            } else {
                LazyVGrid(columns: columns, spacing: Margin.m8.rawValue) {
                    ForEach(viewModel.ads, id: \.self) { ad in
                        AdItemView(viewModel: AdItemViewModel(ad: ad, itemWidth: gridItemWidth))
                            .onTapGesture {
                                viewModel.adSelectedAction?(ad)
                            }
                    }
                }
            }
        }
        .padding(.horizontal, Margin.m4.rawValue)
    }
}
