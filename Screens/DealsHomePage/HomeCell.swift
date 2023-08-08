//
//  HomeCell.swift
//  DealsApp
//
//  Created by Edward Kyles on 7/8/23.
//

import SwiftUI

struct HomeCell: View {
    @State private var deatiledDealID: Set<String> = []
    @StateObject var viewModel = HomeViewModel()
    

    var body: some View {
        VStack {
            if viewModel.deals.isEmpty {
                ProgressView()
            } else {
                List(viewModel.deals) { deal in
                    NavigationLink(destination: DealDetailView(deal: deal)) {
                        VStack(alignment: .leading) {
                            ZStack(alignment: .topTrailing) {
                                AsyncImage(url: URL(string: deal.product.image)) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                } placeholder: {
                                    PlaceholderImageView()
                                }
                                .frame(height: 200)
                                .cornerRadius(8)
                            }
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            Text("Price: $\(deal.price)")
                                .font(.system(size: 15))
                                .foregroundColor(.green)
                                .bold()
                            
                            Text(deal.description)
                                .font(.headline)
                                .foregroundColor(.black)
                                .padding(10)
                            
                            HStack {
                                Spacer()
                                Button(action: {
                                    toggleDealExpansion(deal)
                                }) {
                                    Image(systemName: "text.bubble")
                                }
                                .foregroundColor(.primary)
                                
                            }
                            
                            if deatiledDealID.contains(deal.id) {
                                if deal.comments.isEmpty {
                                    Text("No comment found")
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
                        }
                        .padding()
                        
                    }
                }
            }
        }
        .background(Color.blue)
        .foregroundColor(.white)
    }
    private func toggleDealExpansion(_ deal: Deal) {
        if deatiledDealID.contains(deal.id) {
            deatiledDealID.remove(deal.id)
        } else {
            deatiledDealID.insert(deal.id)
        }
    }
    
}

struct PlaceholderImageView: View {
    var body: some View {
        Color.gray
            .frame(height: 200)
            .cornerRadius(8)
    }
}

struct HomeCell_Previews: PreviewProvider {
    static var previews: some View {
        HomeCell()
    }
}
