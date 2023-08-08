//
//  DealsDetailsPage.swift
//  DealsApp
//
//  Created by Edward Kyles on 7/8/23.
//

import SwiftUI

struct DealDetailView: View {
    let deal: Deal

    init(deal: Deal) {
        self.deal = deal
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                ZStack(alignment: .topTrailing) {
                    if let imageUrl = URL(string: deal.product.image) {
                        AsyncImage(url: imageUrl) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            case .failure:
                                Image(systemName: "xmark.circle")
                                    .font(.largeTitle)
                                    .foregroundColor(.red)
                                Text("Image not found")
                            @unknown default:
                                EmptyView()
                                Text("Image not found")
                            }
                        }
                        .frame(height: 200)
                    } else {
                        Color.gray
                            .frame(height: 200)
                    }

                }

                Text(deal.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
                Text("Price: $\(deal.price)")
                    .font(.headline)
                    .foregroundColor(.red)
                Text(deal.description)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .padding(.horizontal)

              

                Text("Availability: \(deal.product.availability)")
                    .font(.headline)
                    .foregroundColor(.red)

                Text("Updated At: \(deal.product.updatedAt)")
                    .font(.headline)
                    .foregroundColor(.black)

                HStack {
                    Image(systemName: "hand.thumbsup")
                    Text(" \(deal.likes.count)")
                        .font(.headline)
                        .padding(.bottom, 5)
                        .onTapGesture {
                        }
                

              
                    Image(systemName: "hand.thumbsdown")
                    Text(" \(deal.dislikes.count)")
                        .font(.headline)
                        .padding(.bottom, 5)
                        .onTapGesture {
                        }
                }

                VStack(alignment: .leading) {
                    Text("Comments:")
                        .font(.headline)
                        .padding(.bottom, 5)

                    if deal.comments.isEmpty {
                        Text("No comments yet")
                            .foregroundColor(.secondary)
                    } else {
                        ForEach(deal.comments) { comment in
                            VStack(alignment: .leading) {
                                Text(comment.user.name)
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                Text(comment.text)
                                    .font(.subheadline)
                            }
                            .padding(.vertical, 5)
                        }
                    }
                }

                Spacer()
            }
            .padding()
        }
        .navigationBarTitle("Deal Details", displayMode: .inline)
    }

    private var showDiscountBanner: Bool {
        if let imageUrl = URL(string: deal.product.image) {
            return imageIsSmall(imageUrl: imageUrl) || !imageExists(imageUrl: imageUrl)
        }
        return true
    }

    private func imageIsSmall(imageUrl: URL) -> Bool {
        return true
    }

    private func imageExists(imageUrl: URL) -> Bool {
        
        return false
    }
}
