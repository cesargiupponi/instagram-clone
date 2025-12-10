//
//  UploadPostViewModel.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 10/12/25.
//

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

    @MainActor
    func loadImage(fromItem item: PhotosPickerItem?) async {

        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }

        self.postImage = Image(uiImage: uiImage)
    }
}
