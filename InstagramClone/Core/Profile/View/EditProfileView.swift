//
//  EditProfileView.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 12/12/25.
//

import PhotosUI
import SwiftUI

struct EditProfileView: View {

    @Environment(\.dismiss) var dismiss
    @State var viewModel: EditProfileViewModel

    init(user: User) {
        self._viewModel = State(wrappedValue: EditProfileViewModel(user: user))
    }

    var body: some View {
        VStack {
            VStack {
                HStack {
                    Button("Cancel") {
                        dismiss()
                    }
                    
                    Spacer()
                    
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button {
                        Task {
                            try await viewModel.updateUserData()
                        }
                    } label: {
                        Text("Done")
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }
                }
                .padding(.horizontal)
                
                Divider()
            }

            PhotosPicker(selection: $viewModel.selectedImage) {
                VStack {
                    if let image = viewModel.profileImage {
                        image
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundStyle(Color.white)
                            .background(Color.gray)
                            .clipShape(Circle())
                    } else {
                        Image(systemName: "person")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundStyle(Color.white)
                            .background(Color.gray)
                            .clipShape(Circle())
                    }

                    Text("Edit profile picture")
                        .font(.footnote)
                        .fontWeight(.semibold)

                    Divider()
                }
            }
            .padding(.vertical, 8)

            VStack {
                EdiProfileRowView(title: "Name", placeholder: "Enter your name", text: $viewModel.fullName)
                EdiProfileRowView(title: "Bio", placeholder: "Enter your bio", text: $viewModel.bio)
            }

            Spacer()
        }
    }
}

struct EdiProfileRowView: View {

    let title: String
    let placeholder: String
    @Binding var text: String

    var body: some View {
        HStack {
            Text(title)
                .padding(.leading, 8)
                .frame(width: 100, alignment: .leading)

            VStack {
                TextField(placeholder, text: $text)
                Divider()
            }
        }
        .font(.subheadline)
        .frame(height: 36)
    }
}




#Preview {
    EditProfileView(user: User.mockUsers[0])
}
