//
//  AddEmailView.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 28/11/25.
//

import SwiftUI

struct AddEmailView: View {

    @Environment(\.dismiss) private var dismiss
    @State private var email: String = ""

    var body: some View {
        VStack(spacing: 12) {
            AuthFormView(
                title: "Add your Email",
                subtitle: "Use this email to sign in to your account",
                textFieldPlaceholder: "Email",
                textFieldValue: $email
            )

            NavigationLink {
                CreateUsernameView()
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
    AddEmailView()
}
