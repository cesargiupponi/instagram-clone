//
//  ContentView.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 27/11/25.
//

import SwiftUI

struct ContentView: View {

    @State var viewModel = ContentViewModel()
    @State var registrationViewModel = RegistrationViewModel()

    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView()
                    .environment(registrationViewModel)
            } else {
                MainTabView()
            }
        }
    }
}

#Preview {
    ContentView()
}
