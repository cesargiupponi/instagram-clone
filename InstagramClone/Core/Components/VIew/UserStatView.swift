//
//  UserStatView.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 27/11/25.
//

import SwiftUI

struct UserStatView: View {

    let title: String
    let value: Int

    var body: some View {
        VStack {
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.semibold)

            Text(title)
                .font(.footnote)
        }
        .frame(width: 76)
    }
}

#Preview {
    UserStatView(title: "Posts", value: 29)
}
