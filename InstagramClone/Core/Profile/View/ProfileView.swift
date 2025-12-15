//
//  ProfileView.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 27/11/25.
//

import SwiftUI

struct ProfileView: View {

    let user: User

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ProfileHeaderView(user: user)
                PostGridView(user: user)
            }
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProfileView(user: User.mockUsers[2])
}
