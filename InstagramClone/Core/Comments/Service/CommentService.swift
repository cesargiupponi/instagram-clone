//
//  CommentService.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 17/12/25.
//

import Firebase
import FirebaseFirestore
import Foundation

struct CommentService {

    static func uploadComment(_ comment: Comment) async throws {
        guard let commentData = try? Firestore.Encoder().encode(comment) else { return }
        try await Firestore
            .firestore()
            .collection("posts")
            .document(comment.postId)
            .collection("post-comments")
            .addDocument(data: commentData)
    }
}
