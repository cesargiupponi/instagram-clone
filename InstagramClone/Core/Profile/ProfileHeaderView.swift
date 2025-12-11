//
//  ProfileHeaderView.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 08/12/25.
//

import SwiftUI

struct ProfileHeaderView: View {

    let user: User

    var body: some View {
        VStack(spacing: 10) {

            HStack {
                Image(user.profileImageURL ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())

                Spacer()

                HStack(spacing: 8) {
                    UserStatView(title: "Posts", value: 3)
                    UserStatView(title: "Follower", value: 1)
                    UserStatView(title: "Following", value: 1)
                }
            }
            .padding(.horizontal)

            VStack(alignment: .leading, spacing: 4) {
                if let fullName = user.fullName {
                    Text(fullName)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }

                if let bio = user.bio {
                    Text(bio)
                        .font(.footnote)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)

            Button {

            } label: {
                Text(user.isCurrentUser ? "Edit Profile" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .background(user.isCurrentUser ? Color.white : Color(.systemBlue))
                    .foregroundStyle(user.isCurrentUser ? Color.black : Color.white)
                    .clipShape(.rect(cornerRadius: 6))
                    .overlay {
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(user.isCurrentUser ? Color.gray : Color.clear, lineWidth: 1)
                    }
            }

            Divider()
        }
    }
}

#Preview {
    ProfileHeaderView(user: User.mockUsers[0])
}
