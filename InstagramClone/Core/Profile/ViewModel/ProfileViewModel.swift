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

    var stats: UserStats {
        return user.stats ?? .init(followingCount: 0, followersCount: 0, postsCount: 0)
    }

    init(user: User) {
        self.user = user
        checkIfUserIsFollowed()
        fetchUserStats()
    }

    func fetchUserStats() {
        Task {
            self.user.stats = try await UserService.fetchUserStats(uid: user.id)
        }
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
