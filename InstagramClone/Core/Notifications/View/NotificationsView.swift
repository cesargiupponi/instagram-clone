//
//  NotificationsView.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 21/03/26.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(0 ..< 15) { notification in
                        NotificationRowView()
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
