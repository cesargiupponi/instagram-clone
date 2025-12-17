//
//  CommentCellView.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 17/12/25.
//

import SwiftUI

struct CommentCellView: View {

    private var user: User {
        return User.mockUsers[0]
    }

    var body: some View {
        HStack {
            CircularProfileImageView(user: user, size: .xSmall)

            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 2) {
                    Text(user.username)
                        .fontWeight(.semibold)

                    Text("6d")
                        .foregroundStyle(Color.gray)
                }

                Text("Enjoying a lovely #Caturday! 🐾")
            }
            .font(.caption)

            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    CommentCellView()
}
