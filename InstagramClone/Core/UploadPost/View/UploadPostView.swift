//
//  UploadPostView.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 10/12/25.
//

import PhotosUI
import SwiftUI

struct UploadPostView: View {

    @Binding var tabIndex: Int
    @State private var caption = ""
    @State private var imagePickerPresented = false
    @State var viewModel = UploadPostViewModel()

    var body: some View {
        VStack {
            HStack {
                Button {
                   clearPostDataAndReturnToFeed()
                } label: {
                    Text("Cancel")

                }

                Spacer()

                Text("New Post")
                    .fontWeight(.semibold)

                Spacer()

                Button {
                    Task {
                        try await viewModel.uploadPost(caption: caption)
                        clearPostDataAndReturnToFeed()
                    }
                } label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                }
            }
            .padding(.horizontal)

            HStack(spacing: 8) {
                if let image = viewModel.postImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                }

                TextField("Enter your caption...", text: $caption, axis: .vertical)
            }
            .padding()

            Spacer()
        }
        .onAppear {
            imagePickerPresented.toggle()
        }
        .photosPicker(isPresented: $imagePickerPresented, selection: $viewModel.selectedImage)
    }

    func clearPostDataAndReturnToFeed() {
        caption = ""
        viewModel.selectedImage = nil
        viewModel.postImage = nil
        tabIndex = 0
    }
}

#Preview {
    UploadPostView(tabIndex: .constant(0))
}
