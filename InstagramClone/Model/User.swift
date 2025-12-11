//
//  User.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 08/12/25.
//

import FirebaseAuth
import Foundation

struct User: Identifiable, Hashable, Codable {
    let id: String
    var username: String
    var profileImageURL: String?
    var fullName: String?
    var bio: String?
    let email: String

    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
}

extension User {
    static var mockUsers: [User] {
        return [
            User(id: UUID().uuidString, username: "frajola", profileImageURL: "frajola", fullName: "Sylvester", bio: "Hello, world!", email: "frajola@example.com"),
            User(id: UUID().uuidString, username: "pernalonga", profileImageURL: "pernalonga", fullName: "Bugs Bunny", bio: "Hello, world!", email: "pernlonga@example.com"),
            User(id: UUID().uuidString, username: "pikachu", profileImageURL: "pikachu", fullName: "Jean-Luc Pikachu", bio: "Hello, world!", email: "pikachu@example.com"),
            User(id: UUID().uuidString, username: "spike", profileImageURL: "spike", fullName: "Spike Bulldog", bio: "Hello, world!", email: "spike@example.com")
        ]
    }
}
