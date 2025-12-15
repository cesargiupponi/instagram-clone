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
        self.posts = try await PostService.fethcFeedPosts()
    }
}
