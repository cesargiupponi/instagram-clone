//
//  UploadPostViewModel.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 10/12/25.
//

import Firebase
import FirebaseAuth
import Foundation
import PhotosUI
import SwiftUI

@Observable
class UploadPostViewModel {

    var selectedImage: PhotosPickerItem? {
        didSet {
            Task {
                await loadImage(fromItem: selectedImage)
            }
        }
    }

    var postImage: Image?
    private var uiImage: UIImage?

    @MainActor
    func loadImage(fromItem item: PhotosPickerItem?) async {

        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.postImage = Image(uiImage: uiImage)
    }

    func uploadPost(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let uiImage = uiImage else { return }

        let postRef = Firestore.firestore().collection("posts").document()
        guard let imageUrl = try await ImageUploader.uploadImage(image: uiImage) else { return }
        let post = Post(id: postRef.documentID, ownerId: uid, caption: caption, likes: 0, imageUrl: imageUrl, timestamp: Timestamp())
        guard let encodedPost = try? Firestore.Encoder().encode(post) else { return }

        try await postRef.setData(encodedPost)
    }
}
