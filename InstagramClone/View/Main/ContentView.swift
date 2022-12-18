//
//  ContentView.swift
//  InstagramClone
//
//  Created by AKHIL KUNJUMON MARKOSE on 20/10/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State var selctedIndex = 0
    
    var body: some View {
        Group {
            //if not logged in show login view
            // else show maintab view
            if viewModel.userSession == nil {
                LoginView()
            } else {
                if let user = viewModel.currentUser {
                    MainTabView(user: user, selectedIndex: $selctedIndex)
                }
            }
        }
    }
}


