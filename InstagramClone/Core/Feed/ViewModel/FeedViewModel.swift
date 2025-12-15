//
//  FeedViewModel.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 15/12/25.
//

import Firebase
import Foundation

@Observable
class FeedViewModel {

    var posts = [Post]()

    init() {
        Task {
            try await fetchPosts()
        }
    }

    func fetchPosts() async throws {
        let snapshot = try await Firestore.firestore().collection("posts").getDocuments()
        self.posts = try snapshot.documents.compactMap { try $0.data(as: Post.self) }

        for i in 0 ..< self.posts.count {
            let post = posts[i]
            let ownerId = post.ownerId
            let postUser = try await UserService.fetchUser(withUid: ownerId)
            self.posts[i].user = postUser
        }
    }
}
