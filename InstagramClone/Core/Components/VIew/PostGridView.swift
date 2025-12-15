//
//  PostGridView.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 08/12/25.
//

import Kingfisher
import SwiftUI

struct PostGridView: View {

    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]

    private let imageDimension: CGFloat = (UIScreen.main.bounds.width / 3) - 1

    @State var viewModel: PostGridViewModel

    init(user: User) {
        self._viewModel = State(wrappedValue: PostGridViewModel(user: user))
    }

    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 1) {
            ForEach(viewModel.posts) { post in
                KFImage(URL(string: post.imageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageDimension, height: imageDimension)
                    .clipped()
            }
        }
    }
}

#Preview {
    PostGridView(user: User.mockUsers[0])
}
