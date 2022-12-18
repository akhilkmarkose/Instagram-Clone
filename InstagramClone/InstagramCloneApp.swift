//
//  InstagramCloneApp.swift
//  InstagramClone
//
//  Created by AKHIL KUNJUMON MARKOSE on 20/10/22.
//

import SwiftUI
import Firebase

@main
struct InstagramCloneApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            //root view of the app is content view
            ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}
