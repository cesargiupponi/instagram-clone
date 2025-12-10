//
//  CreatePasswordView.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 28/11/25.
//

import SwiftUI

struct CreatePasswordView: View {

    @Environment(\.dismiss) private var dismiss
    @Environment(RegistrationViewModel.self) var viewModel: RegistrationViewModel
    @State private var password: String = ""

    var body: some View {
        VStack(spacing: 12) {
            Text("Create password")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)

            Text("Your password must be at least 6 characters in length")
                .font(.footnote)
                .foregroundStyle(Color.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)

            SecureField("Password", text: $password)
                .textInputAutocapitalization(.never)
                .modifier(IGTextFieldModifier())
                .padding(.top)

            NavigationLink {
               CompleteSignUpView()
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
            password = viewModel.password
        }
        .onChange(of: password) { oldValue, newValue in
            viewModel.password = newValue
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
    CreatePasswordView()
}
