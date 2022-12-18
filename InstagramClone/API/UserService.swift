//
//  UserService.swift
//  InstagramClone
//
//  Created by AKHIL KUNJUMON MARKOSE on 10/11/22.
//

import Foundation
import SwiftUI

typealias FirestoreCompletion = ((Error?) -> Void)?

struct UserService {
    
    // function to call when a user presses the follow button
    static func follow(uid: String, completion: ((Error?) -> Void)?) {
        //get the current user id
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        //logged in user following the current user selected in the profile view
        COLLECTION_FOLLOWING.document(currentUid)
            .collection("user-following").document(uid).setData([:]) { _ in
                //current user following the logged in user (vice versa of above)
                COLLECTION_FOLLOWERS.document(uid).collection("user-followers")
                    .document(currentUid).setData([:], completion: completion)
            }
    }
    
    static func unfollow(uid: String, completion: ((Error?) -> Void)?) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_FOLLOWING.document(currentUid)
            .collection("user-following").document(uid).delete { _ in
                COLLECTION_FOLLOWERS.document(uid).collection("user-followers").document(currentUid).delete(completion: completion)
            }
        
    }
    
    static func checkIfuserIsfollowed(uid: String, completion: @escaping (Bool) -> Void) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_FOLLOWING.document(currentUid).collection("user-following").document(uid).getDocument { snapshot, error in
            guard let isfollowed = snapshot?.exists else { return }
            completion(isfollowed)
        }
        
    }
}
