//
//  Deals.swift
//  DealsApp
//
//  Created by Edward Kyles on 7/4/23.
//

import Foundation

struct DealsResponse: Decodable {
    let data: Deals
}

struct Deals: Decodable {
    let deals: [Deal]
}

struct Deal: Decodable, Identifiable {
    let id: String
    let title: String
    let url: String
    let price: Int
    let description: String
    let product: Product
    let createdAt: String
    let updatedAt: String
    let likes: [Like]
    let dislikes: [Dislike]
    let comments: [Comment]
    
    
    static func == (lhs: Deal, rhs: Deal) -> Bool {
          return lhs.id == rhs.id
      }
    
    
    static let example = Deal(
            id: "0",
            title: "My Deal",
            url: "https://test.com",
            price: 99,
            description: "Test Deal",
            product: Product.example,
            createdAt: "1010",
            updatedAt: "1111",
            likes: [],
            dislikes: [],
            comments: []
        )
}

struct Product: Decodable {
    let availability: String
    let image: String
    let description: String
    let sku: String
    let updatedAt: String
    
    static let example = Product(
            availability: "IN STOCK",
            image: "https://example.com/image.jpg",
            description: "Test",
            sku: "532",
            updatedAt: "11111"
        )
}

struct Like: Decodable, Identifiable {
    let id: String
    let user: User
}

struct User: Decodable {
    let id: String?
    let name: String
}

struct Dislike: Decodable, Identifiable {
    let id: String
    let user: User
}

struct Comment: Decodable, Identifiable {
    let id: String
    let createdAt: String
    let text: String
    let user: User
}
