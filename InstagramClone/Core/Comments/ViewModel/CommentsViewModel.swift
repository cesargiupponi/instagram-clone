//
//  CommentsViewModel.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 17/12/25.
//

import Firebase
import FirebaseAuth
import Foundation

@Observable
class CommentsViewModel {

    private let post: Post
    var comments = [Comment]()

    init(post: Post) {
        self.post = post
    }

    func uploadComment(_ commentText: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }

        let comment = Comment(commentOwnerUid: uid,
                              commentText: commentText,
                              postId: post.id,
                              postOwnerUid: post.ownerId,
                              timestamp: Timestamp()
        )

        try await CommentService.uploadComment(comment)
    }
}
