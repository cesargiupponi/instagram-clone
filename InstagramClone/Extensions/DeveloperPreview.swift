//
//  DeveloperPreview.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 17/12/25.
//

import Firebase
import Foundation
import SwiftUI

// Global instance for use in #Preview macros
let dev = DeveloperPreview.shared

class DeveloperPreview {

    static let shared = DeveloperPreview()

    let comment: Comment = {
        var comment = Comment(
            commentOwnerUid: User.mockUsers[0].id,
            commentText: "Mock comment",
            postId: Post.mockPosts[0].id,
            postOwnerUid: Post.mockPosts[0].ownerId,
            timestamp: Timestamp()
        )
        comment.user = User.mockUsers[0]
        return comment
    }()
    
    let user = User.mockUsers[0]
    let post = Post.mockPosts[0]
}
