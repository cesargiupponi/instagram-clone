//
//  ProfileView.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 27/11/25.
//

import SwiftUI

struct ProfileView: View {

    let user: User

    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
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
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 360, height: 32)
                            .foregroundStyle(Color.black)
                            .overlay {
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color.gray, lineWidth: 1)
                            }
                    }

                    Divider()
                }

                LazyVGrid(columns: gridItems, spacing: 1) {
                    ForEach(1 ... 12, id: \.self) { index in
                        Image("post\(index)")
                            .resizable()
                            .scaledToFill()
                    }
                }
            }
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProfileView(user: User.mockUsers[0])
}
