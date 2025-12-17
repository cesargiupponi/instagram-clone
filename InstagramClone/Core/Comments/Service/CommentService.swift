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

    let postId: String

    func uploadComment(_ comment: Comment) async throws {
        guard let commentData = try? Firestore.Encoder().encode(comment) else { return }
        try await Firestore
            .firestore()
            .collection("posts")
            .document(postId)
            .collection("post-comments")
            .addDocument(data: commentData)
    }

    func fetchComments() async throws -> [Comment] {
        let snapshot = try await Firestore
            .firestore()
            .collection("posts")
            .document(postId)
            .collection("post-comments")
            .order(by: "timestamp", descending: true)
            .getDocuments()

        return snapshot.documents.compactMap { try? $0.data(as: Comment.self) }
    }
}
