//
//  NotificationCell.swift
//  InstagramClone
//
//  Created by AKHIL KUNJUMON MARKOSE on 22/10/22.
//

import SwiftUI

struct NotificationCell: View {
    @State private var showPostImage = true
    
    var body: some View {
        HStack(alignment: .top) {
            Image("Tovino-Thomas")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipped()
                .clipShape(Circle())
            
            Text("Tovino_Thomas")
                .font(.system(size: 14, weight: .semibold)) +
            Text(" liked one of your post ")
                .font(.system(size: 15))
            
            Spacer()
            
            if showPostImage {
                Image("Tovino-Thomas")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipped()
            } else {
                Button {
                    
                } label: {
                    Text("Follow")
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .font(.system(size: 14, weight: .semibold))
                }

            }
        }
        .padding(.horizontal)
        }
    }


struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell()
    }
}
