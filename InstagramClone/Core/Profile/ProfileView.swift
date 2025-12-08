//
//  ProfileView.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 27/11/25.
//

import SwiftUI

struct ProfileView: View {

    let user: User

    var posts: [Post] {
        return Post.mockPosts.filter { $0.user?.username == user.username }
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ProfileHeaderView(user: user)
                PostGridView(posts: posts)
            }
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProfileView(user: User.mockUsers[2])
}
