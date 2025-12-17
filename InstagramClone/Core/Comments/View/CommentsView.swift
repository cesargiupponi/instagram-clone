//
//  CommentsView.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 17/12/25.
//

import SwiftUI

struct CommentsView: View {

    @State private var commentText = ""

    var body: some View {
        VStack {
            Text("Comments")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(.top, 24)

            Divider()

            ScrollView {
                LazyVStack(spacing: 24) {
                    ForEach(0 ... 3, id: \.self) { comment in
                        CommentCellView()
                    }
                }
            }
            .padding(.top)

            Divider()

            HStack(spacing: 12) {
                CircularProfileImageView(user: User.mockUsers[0], size: .xSmall)

                ZStack(alignment: .trailing) {
                    TextField("Add a comment...", text: $commentText, axis: .vertical)
                        .font(.footnote)
                        .padding(12)
                        .padding(.leading, 12)
                        .padding(.trailing, 40)
                        .overlay {
                            Capsule()
                                .stroke(Color(.systemGray5), lineWidth: 1)
                        }

                    Button {

                    } label: {
                        Text("Post")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color(.systemBlue))
                    }
                    .padding(.horizontal)
                }
            }
            .padding()
        }
    }
}

#Preview {
    CommentsView()
}
