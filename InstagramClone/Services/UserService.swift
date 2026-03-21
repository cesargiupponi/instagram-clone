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
        let snapshot = try await FirebaseConstants.UsersCollection.getDocuments()
        return snapshot.documents.compactMap { try? $0.data(as: User.self) }
    }

    static func fetchUser(withUid uid: String) async throws -> User {
        let snapshot = try await FirebaseConstants.UsersCollection.document(uid).getDocument()
        return try snapshot.data(as: User.self)
    }

    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        self.currentUser = try await FirebaseConstants.UsersCollection.document(uid).getDocument(as: User.self)
    }

    static func fetchUsers(forConfig config: UserListConfig) async throws -> [User] {
        switch config {
        case .followers(let uid):
            return try await fetchFollowers(withUid: uid)
        case .following(let uid):
            return try await fetchFollowing(withUid: uid)
        case .likes(let postId):
            return try await fetchPostLikesUSers(withPostId: postId)
        case .explore:
            return try await fetchAllUsers()
        }
    }

    private static func fetchFollowers(withUid uid: String) async throws -> [User] {
        let snapshot = try await FirebaseConstants
            .FollowersCollection
            .document(uid)
            .collection("user-followers")
            .getDocuments()

        return try await fetchUsers(snapshot)
    }

    private static func fetchFollowing(withUid uid: String) async throws -> [User] {
        let snapshot = try await FirebaseConstants
            .FollowingCollection
            .document(uid)
            .collection("user-following")
            .getDocuments()

        return try await fetchUsers(snapshot)
    }

    private static func fetchPostLikesUSers(withPostId postId: String) async throws -> [User] {
        return []
    }

    private static func fetchUsers(_ snapshot: QuerySnapshot) async throws -> [User] {
        var users = [User]()

        for doc in snapshot.documents {
            users.append(try await fetchUser(withUid: doc.documentID))
        }

        return users
    }
}

extension UserService {

    static func follow(uid: String) async throws {
        guard let currenUserUid = Auth.auth().currentUser?.uid else { return }

        async let _ = try await FirebaseConstants
            .FollowingCollection
            .document(currenUserUid)
            .collection("user-following")
            .document(uid)
            .setData([:])

        async let _ = try await FirebaseConstants
            .FollowersCollection
            .document(uid)
            .collection("user-followers")
            .document(currenUserUid)
            .setData([:])
    }

    static func unfollow(uid: String) async throws {
        guard let currenUserUid = Auth.auth().currentUser?.uid else { return }

        async let _ = try await FirebaseConstants
            .FollowingCollection
            .document(currenUserUid)
            .collection("user-following")
            .document(uid)
            .delete()

        async let _ = try await FirebaseConstants
            .FollowersCollection
            .document(uid)
            .collection("user-followers")
            .document(currenUserUid)
            .delete()
    }

    static func checkIfUserIsFollowed(uid: String) async throws -> Bool {
        guard let currenUserUid = Auth.auth().currentUser?.uid else { return false }

        let snapshot = try await FirebaseConstants
            .FollowingCollection
            .document(currenUserUid)
            .collection("user-following")
            .document(uid)
            .getDocument()

        return snapshot.exists
    }
}

extension UserService {

    static func fetchUserStats(uid: String) async throws -> UserStats {
        async let followingCount = FirebaseConstants
            .FollowingCollection
            .document(uid)
            .collection("user-following")
            .getDocuments()
            .count

        async let followersCount = FirebaseConstants
            .FollowersCollection
            .document(uid)
            .collection("user-followers")
            .getDocuments()
            .count

        async let postsCount = FirebaseConstants
            .PostsCollection
            .whereField("ownerId", isEqualTo: uid)
            .getDocuments()
            .count
        
        return try await UserStats(
            followingCount: followingCount,
            followersCount: followersCount,
            postsCount: postsCount
        )
    }
}
