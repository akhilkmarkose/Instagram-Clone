//
//  ProfileViewModel.swift
//  InstagramClone
//
//  Created by AKHIL KUNJUMON MARKOSE on 09/11/22.
//

import Foundation
import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
        checkIfUserIsFollowed()
    }
    
    func follow() {
        guard let uid = user.id else { return }
        UserService.follow(uid: uid) { error in
            self.user.isFollowed = true
        }
        print("DEBUG: followed user...")
    }
    
    func unfollow() {
        guard let uid = user.id else { return }
        UserService.unfollow(uid: uid) { _ in
            self.user.isFollowed = false
        }
        print("DEBUG: unfollowed user....")
    }
    
    func checkIfUserIsFollowed() {
        print("DEBUGGER: checkIfUserIsFollowed() function called")
        guard !user.isCurrentUser else { return }
        guard let uid = user.id else { return }
        UserService.checkIfuserIsfollowed(uid: uid) { isFollowed in
            self.user.isFollowed = isFollowed
        }
    }
}
