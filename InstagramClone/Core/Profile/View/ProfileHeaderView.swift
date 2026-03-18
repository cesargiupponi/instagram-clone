//
//  ProfileHeaderView.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 08/12/25.
//

import SwiftUI

struct ProfileHeaderView: View {

    @State var viewModel: ProfileViewModel
    @State private var showEditProfile = false

    private var buttonTitle: String {
        if viewModel.user.isCurrentUser {
            return "Edit Profile"
        } else {
            return viewModel.isFollowed ? "Following" : "Follow"
        }
    }

    private var buttonBackgroundColor: Color {
        if viewModel.user.isCurrentUser || viewModel.isFollowed {
            return .white
        } else {
            return Color(.systemBlue)
        }
    }

    private var buttonForegroundColor: Color {
        if viewModel.user.isCurrentUser || viewModel.isFollowed {
            return .black
        } else {
            return .white
        }
    }

    private var buttonBorderColor: Color {
        if viewModel.user.isCurrentUser || viewModel.isFollowed {
            return .gray
        } else {
            return .clear
        }
    }

    init(user: User) {
        self.viewModel = ProfileViewModel(user: user)
    }

    var body: some View {
        VStack(spacing: 10) {

            HStack {
                CircularProfileImageView(user: viewModel.user, size: .large)

                Spacer()

                HStack(spacing: 8) {
                    UserStatView(title: "Posts", value: 3)
                    UserStatView(title: "Follower", value: 1)
                    UserStatView(title: "Following", value: 1)
                }
            }
            .padding(.horizontal)

            VStack(alignment: .leading, spacing: 4) {
                if let fullName = viewModel.user.fullName {
                    Text(fullName)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }

                if let bio = viewModel.user.bio {
                    Text(bio)
                        .font(.footnote)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)

            Button {
                if viewModel.user.isCurrentUser {
                    showEditProfile.toggle()
                } else {
                    handleFollowTapped()
                }
            } label: {
                Text(buttonTitle)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .background(buttonBackgroundColor)
                    .foregroundStyle(buttonForegroundColor)
                    .clipShape(.rect(cornerRadius: 6))
                    .overlay {
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(buttonBorderColor, lineWidth: 1)
                    }
            }

            Divider()
        }
        .fullScreenCover(isPresented: $showEditProfile) {
            EditProfileView(user: viewModel.user)
        }
    }

    func handleFollowTapped() {
        if viewModel.isFollowed {
            viewModel.unfollow()
        } else {
            viewModel.follow()
        }
    }
}

#Preview {
    ProfileHeaderView(user: User.mockUsers[0])
}
