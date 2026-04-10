//
//  NotificationRowView.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 21/03/26.
//

import SwiftUI

struct NotificationRowView: View {

    let notification: Notification

    var body: some View {
        HStack {
            CircularProfileImageView(size: .xSmall)

            HStack {
                Text("cesar")
                    .font(.subheadline)
                    .fontWeight(.semibold) +

                Text(" \(notification.type.notificationMessage)")
                    .font(.subheadline) +

                Text(" 3w")
                    .foregroundStyle(Color.gray)
                    .font(.footnote)
            }

            Spacer()

            if notification.type != .follow {
                Image(.spike)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipped()
                    .padding(.leading, 2)
            } else {
                Button {

                } label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 88, height: 32)
                        .foregroundStyle(.white)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    NotificationRowView(notification: DeveloperPreview.shared.notifications[0])
}
