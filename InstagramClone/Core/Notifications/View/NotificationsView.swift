//
//  NotificationsView.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 21/03/26.
//

import SwiftUI

struct NotificationsView: View {

    @State private var viewModel = NotificationViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(viewModel.notifications) { notification in
                        NotificationRowView(notification: notification)
                            .padding(.top)
                    }
                }
            }
            .navigationTitle("Notifications")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NotificationsView()
}
