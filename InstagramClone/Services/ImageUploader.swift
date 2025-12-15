//
//  ImageUploader.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 15/12/25.
//

import FirebaseStorage
import UIKit

struct ImageUploader {

    static func uploadImage(image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {
            return nil
        }
        let filename = UUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")

        do {
            let _ = try await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL()
            return url.absoluteString
        } catch {
            #if DEBUG
                print("Upload image error: \(error.localizedDescription)")
            #endif
            return nil
        }
    }
}
