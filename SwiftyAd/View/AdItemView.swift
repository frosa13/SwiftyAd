//
//  AdItemView.swift
//  SwiftyAd
//
//  Created by Francisco Rosa on 15/03/2025.
//

import SwiftUI

struct AdItemView: View {
    @ObservedObject var viewModel: AdItemViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack(alignment: .top) {
                if let image = viewModel.ad.imagesURL.thumb, let imageURL = URL(string: image) {
                    AsyncImage(url: imageURL) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                        case .failure:
                            defaultImage
                        @unknown default:
                            defaultImage
                        }
                    }
                    .scaledToFill()
                    .frame(width: viewModel.itemWidth, height: viewModel.itemWidth * 0.8)
                } else {
                    defaultImage
                }
                
                if viewModel.ad.isUrgent {
                    HStack {
                        Spacer()
                        
                        Text("Urgent")
                            .padding(.horizontal, Margin.m16.rawValue)
                            .padding(.vertical, Margin.m4.rawValue)
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .background(Color.orange)
                            .zIndex(1)
                            .clipShape(.capsule)
                    }
                    .padding(Margin.m16.rawValue)
                }
            }
            
            Group {
                Text(viewModel.ad.title)
                    .font(.headline)
                    .fontWeight(.black)
                    .foregroundStyle(.black)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                
                HStack(alignment: .center, spacing: Margin.m8.rawValue) {
                    if let category = viewModel.ad.category?.name {
                        Text(category)
                            .fontWeight(.semibold)
                            .foregroundStyle(.gray)
                            .lineLimit(1)
                    }
                    
                    Spacer()
                    
                    Text(viewModel.ad.price.formattedPrice())
                        .font(.footnote)
                        .foregroundStyle(.black)
                        .lineLimit(1)
                }
            }
            .padding(.top, Margin.m8.rawValue)
            .padding([.leading, .bottom, .trailing], Margin.m8.rawValue)
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: Radius.r8.rawValue))
        .shadow(
            color: .black.opacity(0.15),
            radius: Radius.r32.rawValue,
            x: 0,
            y: 16
        )
    }
    
    var defaultImage: some View {
        Image(systemName: ImageName.slashRectangle)
            .resizable()
            .scaledToFit()
            .foregroundStyle(.gray)
            .frame(width: 50, height: 50)
            .padding()
    }
}
