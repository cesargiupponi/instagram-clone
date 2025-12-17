//
//  UserService.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 10/12/25.
//

import Firebase
import FirebaseAuth
import FirebaseFirestore
import Foundation

@Observable
class UserService {

    static let shared = UserService()

    var currentUser: User?

    static func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap { try? $0.data(as: User.self) }
    }

    static func fetchUser(withUid uid: String) async throws -> User {
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        return try snapshot.data(as: User.self)
    }

    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        self.currentUser = try await Firestore.firestore().collection("users").document(uid).getDocument(as: User.self)
    }
}
