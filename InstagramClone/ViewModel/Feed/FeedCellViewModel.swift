//
//  FeedCellViewModel.swift
//  InstagramClone
//
//  Created by AKHIL KUNJUMON MARKOSE on 14/11/22.
//

import Foundation
import SwiftUI

class FeedCellViewModel: ObservableObject {
    @Published var post: Post
    
    var likeString: String {
        let label = post.likes == 1 ? "like" : "likes"
        return "\(post.likes) \(label)"
    }
    
    init(post: Post) {
        self.post = post
    }
    
    func like() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        guard let postId = post.id else { return }
        
        COLLECTION_POSTS.document(postId).collection("post-likes").document(uid).setData([:]) { _ in
            COLLECTION_USERS.document(uid).collection("user-likes").document(postId).setData([:]) { _ in
                COLLECTION_POSTS.document(postId).updateData(["likes" : self.post.likes + 1])
                self.post.didLike = true
                self.post.likes += 1
            }
        }
    }
    
    func unlike() {

    }
    
    func checkIfUserLikedPost() {
        
    }
}
