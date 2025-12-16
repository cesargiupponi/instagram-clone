//
//  FeedCellViewModel.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 16/12/25.
//

import Foundation

@Observable
class FeedCellViewModel {

    var post: Post

    init(post: Post) {
        self.post = post
        Task {
            try await checkIfCurrentUserLikedPost()
        }
    }

    func like() async throws {
        do {
            post.didLike = true
            post.likes += 1
            try await PostService.likePost(post)
        }
        catch {
            post.didLike = false
            post.likes -= 1
        }
    }

    func unlike() async throws {
        do {
            post.didLike = false
            post.likes -= 1
            try await PostService.unlikePost(post)
        }
        catch {
            post.didLike = true
            post.likes += 1
        }
    }

    func checkIfCurrentUserLikedPost() async throws {
        self.post.didLike = try await PostService.checkIfCurrentUserLikedPost(post)
    }
}
