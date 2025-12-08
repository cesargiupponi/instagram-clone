//
//  FeedView.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 28/11/25.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 32) {
                    ForEach(Post.mockPosts) { post in
                        FeedCellView(post: post)
                    }
                }
                .padding(.top, 8)
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(.instagramLogo)
                        .resizable()
                        .frame(width: 100, height: 32)
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "paperplane")
                        .resizable()
                        .imageScale(.large)
                }
            }
        }
    }
}

#Preview {
    FeedView()
}
