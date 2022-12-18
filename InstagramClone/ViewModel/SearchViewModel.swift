//
//  SearchViewModel.swift
//  InstagramClone
//
//  Created by AKHIL KUNJUMON MARKOSE on 09/11/22.
//

import Foundation
import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        COLLECTION_USERS.getDocuments { snapshot, error in
            guard let documents = snapshot?.documents else {
                print("DEBUG: No Documents")
                return
            }
            
            self.users = documents.compactMap({ queryDocumentsnapshot in
                try? queryDocumentsnapshot.data(as: User.self)
            })
            
            print(self.users)
        }
    }
    
    func filteredUsers(_ query: String) -> [User] {
        let lowercasedQuery = query.lowercased()
        return users.filter { user in
            user.fullname.lowercased().contains(lowercasedQuery) || user.username.lowercased().contains(lowercasedQuery)
        }
    }
}
