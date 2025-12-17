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
    private let service: CommentService
    var comments = [Comment]()

    init(post: Post) {
        self.post = post
        self.service = CommentService(postId: post.id)

        Task {
            try await fetchComments()
        }
    }

    func uploadComment(commentText: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }

        let comment = Comment(commentOwnerUid: uid,
                              commentText: commentText,
                              postId: post.id,
                              postOwnerUid: post.ownerId,
                              timestamp: Timestamp()
        )

        try await service.uploadComment(comment)
        try await fetchComments()
    }

    func fetchComments() async throws {
        self.comments = try await service.fetchComments()
        try await fetchUserDataForComments()
    }

    private func fetchUserDataForComments() async throws {
        for i in 0 ..< comments.count {
            let comment = comments[i]
            let user = try await UserService.fetchUser(withUid: comment.commentOwnerUid)
            comments[i].user = user
        }
    }
}
