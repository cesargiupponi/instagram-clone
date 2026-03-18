//
//  ProfileViewModel.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 18/03/26.
//

import Foundation

@Observable
class ProfileViewModel {

    var user: User

    var isFollowed: Bool {
        return user.isFollowed ?? false
    }

    init(user: User) {
        self.user = user
        checkIfUserIsFollowed()
    }
    
}

extension ProfileViewModel {

    func follow() {
        Task {
            try await UserService.follow(uid: user.id)
            user.isFollowed = true
        }
    }

    func unfollow() {
        Task {
            try await UserService.unfollow(uid: user.id)
            user.isFollowed = false
        }
    }

    func checkIfUserIsFollowed() {
        Task {
            self.user.isFollowed = try await UserService.checkIfUserIsFollowed(uid: user.id)
        }
    }
}
