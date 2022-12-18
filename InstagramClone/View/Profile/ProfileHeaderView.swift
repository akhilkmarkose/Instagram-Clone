//
//  ProfileHeaderView.swift
//  InstagramClone
//
//  Created by AKHIL KUNJUMON MARKOSE on 25/10/22.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                KFImage(URL(string: viewModel.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .padding(.leading)
                
                Spacer()
                
                HStack(spacing: 8) {
                    UserStatView(value: 3, title: "Posts")
                    UserStatView(value: 2, title: "Followers")
                    UserStatView(value: 1, title: "Following")
                }
                .padding(.trailing, 24)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(viewModel.user.fullname)
                    .font(.system(size: 15, weight: .semibold))
                    .padding(.top, 5)
                
                Text("Minnal Murali | Actor")
                    .font(.system(size: 15))

            }
            .padding(.horizontal)
            
            HStack {
                Spacer()
                
                ProfileActionButtonView(viewModel: viewModel)
                
                Spacer()
            }
            .padding(.top, 10)
        }
    }
}

//struct ProfileHeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileHeaderView()
//    }
//}
