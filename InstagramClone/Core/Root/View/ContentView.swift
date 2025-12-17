//
//  ContentView.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 27/11/25.
//

import SwiftUI

struct ContentView: View {

    @Environment(AuthService.self) var authService
    @State var registrationViewModel = RegistrationViewModel()

    var body: some View {
        Group {
            if authService.userSession == nil {
                LoginView()
                    .environment(registrationViewModel)
            } else if let currentUser = UserService.shared.currentUser {
                MainTabView(user: currentUser)
            } else {
                // Loading state while user data is being fetched
                ProgressView()
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(AuthService.shared)
}
