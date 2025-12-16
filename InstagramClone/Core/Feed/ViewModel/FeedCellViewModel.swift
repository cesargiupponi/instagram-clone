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
    }

    func like() async throws {
        post.didLike = true
        post.likes += 1
    }

    func unlike() async throws {
        post.didLike = false
        post.likes -= 1
    }
}
