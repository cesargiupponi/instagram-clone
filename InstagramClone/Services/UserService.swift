//
//  UserService.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 10/12/25.
//

import Firebase
import Foundation

struct UserService {

    static func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap { try? $0.data(as: User.self) }
    }
}
