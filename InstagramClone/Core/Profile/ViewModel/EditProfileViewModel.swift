//
//  EditProfileViewModel.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 12/12/25.
//

import Firebase
import PhotosUI
import SwiftUI

@Observable
class EditProfileViewModel {

    var profileImage: Image?
    var fullName: String = ""
    var bio: String = ""
    var user: User

    var selectedImage: PhotosPickerItem? {
        didSet {
            Task {
                await loadImage(fromItem: selectedImage)
            }
        }
    }

    init(user: User) {
        self.user = user
    }

    @MainActor
    func loadImage(fromItem item: PhotosPickerItem?) async {

        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }

        self.profileImage = Image(uiImage: uiImage)
    }

    func updateUserData() async throws {

        var data = [String: Any]()

        if !fullName.isEmpty && user.fullName != fullName {
            data["fullName"] = fullName
        }
        if !bio.isEmpty && user.bio != bio {
            data["bio"] = bio
        }

        if !data.isEmpty {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }

    }
}
