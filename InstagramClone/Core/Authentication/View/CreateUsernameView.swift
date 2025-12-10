//
//  CreateUsernameView.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 28/11/25.
//

import SwiftUI

struct CreateUsernameView: View {

    @Environment(\.dismiss) private var dismiss
    @Environment(RegistrationViewModel.self) var viewModel: RegistrationViewModel
    @State private var username: String = ""

    var body: some View {
        VStack {
            AuthFormView(
                title: "Create username",
                subtitle: "You'll use this username to sign in to your account.",
                textFieldPlaceholder: "Username",
                textFieldValue: $username
            )

            NavigationLink {
                CreatePasswordView()
            } label: {
                Text("Next")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.white)
                    .frame(width: 360, height: 44)
                    .background(Color(.systemBlue))
                    .cornerRadius(8)
            }
            .padding(.vertical)

            Spacer()
        }
        .onAppear {
            username = viewModel.username
        }
        .onChange(of: username) { oldValue, newValue in
            viewModel.username = newValue
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    CreateUsernameView()
}
