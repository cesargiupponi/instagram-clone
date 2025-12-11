//
//  RegistrationViewModel.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 10/12/25.
//

import Foundation

@Observable
class RegistrationViewModel {

    var username: String = ""
    var email: String = ""
    var password: String = ""

    func createUser() async throws {
        do {
            try await AuthService.shared.createUser(email: email, password: password, username: username)
            username = ""
            email = ""
            password = ""
        } catch {
            #if DEBUG
                print("DEBUG: Error creating user: \(error.localizedDescription)")
            #endif
        }
    }
}
