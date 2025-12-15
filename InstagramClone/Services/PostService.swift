//
//  PostService.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 15/12/25.
//

import Firebase
import Foundation

struct PostService {

    private static let postsCollection = Firestore.firestore().collection("posts")

    static func fethcFeedPosts() async throws -> [Post] {
        let snapshot = try await postsCollection.getDocuments()
        var posts = try snapshot.documents.compactMap { try $0.data(as: Post.self) }

        for i in 0 ..< posts.count {
            let post = posts[i]
            let ownerId = post.ownerId
            let postUser = try await UserService.fetchUser(withUid: ownerId)
            posts[i].user = postUser
        }

        return posts
    }

    static func fetchUserPosts(uid: String) async throws -> [Post] {
        let snapshot = try await postsCollection.whereField("ownerId", isEqualTo: uid).getDocuments()
        return try snapshot.documents.compactMap { try $0.data(as: Post.self) }
    }
}
