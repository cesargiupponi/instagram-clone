//
//  CurrentUserProfileview.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 08/12/25.
//

import SwiftUI

struct CurrentUserProfileview: View {

    let user: User

    var posts: [Post] {
        return Post.mockPosts.filter { $0.user?.username == user.username }
    }

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    ProfileHeaderView(user: user)
                    PostGridView(posts: posts)
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        Task {
                            AuthService.shared.signOut()
                        }
                    } label: {
                        Image(systemName: "line.3.horizontal")
                    }
                    .foregroundStyle(Color.black)
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileview(user: User.mockUsers[0])
}
