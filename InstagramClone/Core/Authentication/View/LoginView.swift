//
//  LoginView.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 28/11/25.
//

import SwiftUI

struct LoginView: View {

    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        NavigationStack {
            VStack {

                Spacer()

                Image(.instagramLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 100)

                VStack {
                    TextField("Enter your email", text: $email)
                        .textInputAutocapitalization(.never)
                        .modifier(IGTextFieldModifier())

                    SecureField("Enter your password", text: $password)
                        .modifier(IGTextFieldModifier())
                }

                Button {

                } label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)

                Button {

                } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.white)
                        .frame(width: 360, height: 44)
                        .background(Color(.systemBlue))
                        .cornerRadius(8)
                }
                .padding(.vertical)

                HStack {
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width/2) - 40, height: 0.5)

                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)

                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width/2) - 40, height: 0.5)
                }
                .foregroundStyle(Color.gray)

                HStack {
                    Image(.facebookLogo)
                        .resizable()
                        .frame(width: 20, height: 20)

                    Text("Continue with Facebook")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.systemBlue))
                }
                .padding(.top, 8)

                Spacer()

                Divider()

                NavigationLink {
                    AddEmailView()
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account")
                        Text("Sign up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }
                .padding(.vertical, 16)

            }
        }
    }
}

#Preview {
    LoginView()
}
