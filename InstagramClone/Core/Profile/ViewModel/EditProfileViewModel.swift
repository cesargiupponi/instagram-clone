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

    var selectedImage: PhotosPickerItem? {
        didSet {
            Task {
                await loadImage(fromItem: selectedImage)
            }
        }
    }

    var profileImage: Image?
    var fullName: String = ""
    var bio: String = ""

    @MainActor
    func loadImage(fromItem item: PhotosPickerItem?) async {

        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }

        self.profileImage = Image(uiImage: uiImage)
    }
}
