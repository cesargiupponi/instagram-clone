//
//  AuthService.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 10/12/25.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

@Observable
class AuthService {

    static let shared = AuthService()
    var userSession: FirebaseAuth.User?

    init() {
        self.userSession = Auth.auth().currentUser
    }

    func login(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            #if DEBUG
                print("DEBUG: Error logging in user: \(error.localizedDescription)")
            #endif
        }
    }

    func createUser(email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            await uploadUserData(uid: result.user.uid, username: username, email: email)
        } catch {
            #if DEBUG
                print("DEBUG: Error creating user: \(error.localizedDescription)")
            #endif
        }
    }

    func loadUserData() async throws {

    }

    func signOut() {
        try? Auth.auth().signOut()
        self.userSession = nil
    }

    private func uploadUserData(uid: String, username: String, email: String) async {
        let user = User(id: uid, username: username, email: email)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
    }
}
