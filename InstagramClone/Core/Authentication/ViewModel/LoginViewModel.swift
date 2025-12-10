//
//  LoginViewModel.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 10/12/25.
//

import Foundation

@Observable
class LoginViewModel {
    var email = ""
    var password = ""

    func signIn() async throws {
        try await AuthService.shared.login(email: email, password: password)
    }
}
