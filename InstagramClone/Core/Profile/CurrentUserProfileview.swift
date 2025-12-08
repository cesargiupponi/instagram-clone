//
//  CurrentUserProfileview.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 08/12/25.
//

import SwiftUI

struct CurrentUserProfileview: View {

    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    VStack(spacing: 10) {

                        HStack {
                            Image(.profile)
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
                            Text("Tom & Jerry")
                                .font(.footnote)
                                .fontWeight(.semibold)

                            Text("Classic Cartoon")
                                .font(.footnote)
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
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {

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
    CurrentUserProfileview()
}
