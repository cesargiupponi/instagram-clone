//
//  UserListConfig.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 19/03/26.
//

import Foundation

enum UserListConfig: Hashable {
    case followers(uid: String)
    case following(uid: String)
    case likes(postId: String)
    case explore

    var navigationTitle: String {
        switch self {
        case .followers:
            return "Followers"
        case .following:
            return "Following"
        case .likes:
            return "Likes"
        case .explore:
            return "Explore"
        }
    }
}
