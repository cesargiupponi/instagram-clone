//
//  NotificationRowView.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 21/03/26.
//

import SwiftUI

struct NotificationRowView: View {
    var body: some View {
        HStack {
            CircularProfileImageView(size: .xSmall)

            HStack {
                Text("cesar")
                    .font(.subheadline)
                    .fontWeight(.semibold) +

                Text(" liked one of your post")
                    .font(.subheadline) +

                Text(" 3w")
                    .foregroundStyle(Color.gray)
                    .font(.footnote)
            }

            Spacer()

            Image(.spike)
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipped()
                .padding(.leading, 2)
        }
        .padding(.horizontal)
    }
}

#Preview {
    NotificationRowView()
}
