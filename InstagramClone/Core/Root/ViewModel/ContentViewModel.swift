//
//  ContentViewModel.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 10/12/25.
//

import FirebaseAuth
import Foundation

@Observable
class ContentViewModel {

    private let service = AuthService.shared

    var userSession: FirebaseAuth.User? {
        get {
            service.userSession
        }
        set {
            service.userSession = newValue
        }
    }

    var currentUser: User? {
        get {
            UserService.shared.currentUser
        }
        set {
            UserService.shared.currentUser = newValue
        }
    }

    init() {
        userSession = service.userSession
        currentUser = UserService.shared.currentUser
    }
}
