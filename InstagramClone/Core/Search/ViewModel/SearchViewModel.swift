//
//  SearchViewModel.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 10/12/25.
//

import Foundation

@Observable
class SearchViewModel {

    var users = [User]()

    init() {
        Task {
            try await fetchAllUsers()
        }
    }

    func fetchAllUsers() async throws {
        self.users = try await UserService.fetchAllUsers().filter { $0.id != AuthService.shared.currentUser?.id }
    }
}
