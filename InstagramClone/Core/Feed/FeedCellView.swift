//
//  FeedCellView.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 28/11/25.
//

import SwiftUI

struct FeedCellView: View {
    var body: some View {
        VStack {
            HStack {
                Image(.profile)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())

                Text("spike")
                    .font(.footnote)
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 8)

            Image(.feedSpike1)
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())

            HStack(spacing: 16) {
                Button {

                } label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                }

                Button {

                } label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                }

                Button {

                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 8)
            .padding(.top, 4)
            .foregroundStyle(Color.black)

            Text("23 likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)

            HStack {
                Text("spike ").fontWeight(.semibold) +
                Text("This caption is really long, it should wrap to the next line")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.footnote)
            .padding(.horizontal, 10)
            .padding(.top, 1)

            Text("6h ago")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
                .foregroundStyle(Color.gray)
        }
    }
}

#Preview {
    FeedCellView()
}
