//
//  Post.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 08/12/25.
//

import Foundation

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerId: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Date
    var user: User?
}

extension Post {
    static var mockPosts: [Post] {
        let users = User.mockUsers
        
        return [
            Post(
                id: UUID().uuidString,
                ownerId: users[0].id,
                caption: "Enjoying a lovely #Caturday! 🐾",
                likes: 120,
                imageUrl: "frajola",
                timestamp: Date().addingTimeInterval(-60 * 60 * 2), // 2 hours ago
                user: users[0]
            ),
            Post(
                id: UUID().uuidString,
                ownerId: users[1].id,
                caption: "What's up, doc? 🥕",
                likes: 98,
                imageUrl: "pernalonga",
                timestamp: Date().addingTimeInterval(-60 * 60 * 5), // 5 hours ago
                user: users[1]
            ),
            Post(
                id: UUID().uuidString,
                ownerId: users[2].id,
                caption: "Pika Pika power! Let’s light up the day! ⚡",
                likes: 77,
                imageUrl: "pikachu",
                timestamp: Date().addingTimeInterval(-60 * 60 * 12), // 12 hours ago
                user: users[2]
            ),
            Post(
                id: UUID().uuidString,
                ownerId: users[3].id,
                caption: "Protecting the yard, one bark at a time. 🐶",
                likes: 55,
                imageUrl: "spike",
                timestamp: Date().addingTimeInterval(-60 * 60 * 24), // 1 day ago
                user: users[3]
            )
        ]
    }
}
