//
//  MainTabView.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 27/11/25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                }

            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }

            Text("Upload Post")
                .tabItem {
                    Image(systemName: "plus.square")
                }

            Text("Notifications")
                .tabItem {
                    Image(systemName: "heart")
                }

            CurrentUserProfileview(user: User.mockUsers[0])
                .tabItem {
                    Image(systemName: "person")
                }
        }
        .tint(Color.black)
    }
}

#Preview {
    MainTabView()
}
