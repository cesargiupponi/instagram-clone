//
//  UserListView.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 21/03/26.
//

import SwiftUI

struct UserListView: View {

    @State var viewModel = UserListViewModel()
    @State private var searchText = ""

    private let config: UserListConfig

    init(config: UserListConfig) {
        self.config = config
    }

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(viewModel.users) { user in
                    NavigationLink(value: user) {
                        HStack {
                            CircularProfileImageView(user: user, size: .xSmall)

                            VStack(alignment: .leading) {
                                Text(user.username)
                                    .fontWeight(.semibold)
                                if let fullName = user.fullName {
                                    Text(fullName)
                                }
                            }
                            .font(.footnote)
                        }
                        .foregroundStyle(Color.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    }
                }
            }
            .padding(.top, 8)
            .searchable(text: $searchText, prompt: "Search...")
        }
        .task {
            await viewModel.fetchUsers(forConfig: config)
        }
    }
}

#Preview {
    UserListView(config: .explore)
}
