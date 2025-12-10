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
        try await AuthService.shared.createUser(email: email, password: password, username: username)
    }
}
