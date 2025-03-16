//
//  AdsView.swift
//  SwiftyAd
//
//  Created by Francisco Rosa on 15/03/2025.
//

import SwiftUI

struct AdsView: View {
    
    @StateObject private var viewModel = AdsViewModel()
    @State private var path = NavigationPath()
    @State var selectedAd: Ad?
    
    var body: some View {
        NavigationStack(path: $path) {
            Group {
                if viewModel.error || (viewModel.isLoading == false && viewModel.ads.isEmpty) {
                    VStack(alignment: .center) {
                        
                        Spacer()
                        
                        Image(systemName: ImageName.slashWifi)
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.gray)
                            .frame(width: Size.s150.rawValue, height: Size.s150.rawValue)
                        
                        Text("Something went wrong!\nPlease try again")
                            .font(.headline)
                            .foregroundStyle(.black)
                            .multilineTextAlignment(.center)
                            .padding(.top, Margin.m32.rawValue)
                        
                        Spacer()
                        
                        Button(action: {
                            Task {
                                await viewModel.loadAds()
                            }
                        }) {
                            Text("Try Again")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.vertical, Margin.m16.rawValue)
                                .padding(.horizontal, Margin.m32.rawValue)
                                .frame(maxWidth: .infinity)
                                .background(Color.red)
                                .clipShape(.capsule)
                                .shadow(color: Color.red.opacity(0.5), radius: Radius.r10.rawValue, x: 0, y: 5)
                        }
                        .padding(Margin.m32.rawValue)
                    }
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        AdsGridView(
                            viewModel:
                                AdsGridViewModel(
                                    ads: viewModel.ads,
                                    isLoading: $viewModel.isLoading,
                                    adSelectedAction: { ad in
                                        path.append(ad)
                                    }
                                )
                        )
                        .navigationDestination(for: Ad.self) { ad in
                            AdDetailsViewControllerWrapper(ad: ad)
                                .ignoresSafeArea(.all)
                                .navigationBarBackButtonHidden(true)
                                .toolbar {
                                    ToolbarItem(placement: .topBarLeading) {
                                        Button {
                                            path.removeLast()
                                        } label: {
                                            Image(systemName: ImageName.arrowBack)
                                                .resizable()
                                                .frame(width: Size.s24.rawValue, height: Size.s24.rawValue)
                                                .foregroundStyle(.black)
                                        }
                                    }
                                }
                        }
                    }
                }
            }
            .navigationTitle("Ads")
        }
    }
}
