//
//  ImageUploader.swift
//  InstagramClone
//
//  Created by AKHIL KUNJUMON MARKOSE on 07/11/22.
//

import UIKit
import Firebase
import FirebaseStorage

enum uploadType {
    case profile
    case post
    
    var filePath: StorageReference {
        let filename = NSUUID().uuidString
        switch self {
        case .profile:
            return Storage.storage().reference(withPath: "/profile_images/\(filename)")
            
        case .post:
            return Storage.storage().reference(withPath: "/post_images/\(filename)")
        }
    }
}

struct ImageUploader {
    func uploadImage(image: UIImage, type: uploadType, completion: @escaping (String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.75) else { return }
        let ref = type.filePath
        ref.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("DEBUG: Failed to upload the image. \(error.localizedDescription)")
                return
            }
            
            print("DEBUG: Successfully uploaded image...")
            
            ref.downloadURL { url, error in
                guard let imageUrl = url?.absoluteString else { return }
                completion(imageUrl)
            }
        }
    }
}
