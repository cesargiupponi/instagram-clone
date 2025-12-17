//
//  Comment.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 17/12/25.
//

import Firebase
import FirebaseFirestore
import Foundation

struct Comment: Identifiable, Codable {

    @DocumentID var commentId: String?

    let commentOwnerUid: String
    let commentText: String
    let postId: String
    let postOwnerUid: String
    let timestamp: Timestamp

    var user: User?
    var id: String {
        return commentId ?? UUID().uuidString
    }
}
