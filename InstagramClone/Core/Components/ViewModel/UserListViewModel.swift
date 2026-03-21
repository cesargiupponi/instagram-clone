//
//  UserListViewModel.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 21/03/26.
//

import Foundation

@MainActor
@Observable
class UserListViewModel {

    var users = [User]()

    init() {}

    func fetchUsers(forConfig config: UserListConfig) async {
        do {
            self.users = try await UserService.fetchUsers(forConfig: config)
        } catch {
            print("DEBUG: Failed to fetch users with error: \(error.localizedDescription)")
        }
    }
}
