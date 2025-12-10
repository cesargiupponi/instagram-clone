//
//  AuthService.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 10/12/25.
//

import FirebaseAuth
import Foundation

@Observable
class AuthService {

    static let shared = AuthService()
    var userSession: FirebaseAuth.User?

    init() {
        self.userSession = Auth.auth().currentUser
    }

    func login(email: String, password: String) async throws {

    }

    func createUser(email: String, password: String, username: String) async throws {

    }

    func loadUserData() async throws {

    }

    func signOut() async throws {

    }
}
