//
//  CustomSecureField.swift
//  InstagramClone
//
//  Created by AKHIL KUNJUMON MARKOSE on 27/10/22.
//

import SwiftUI

struct CustomSecureField: View {
    @Binding var text: String
    let placeholder: Text
    
    var body: some View {
        ZStack {
            HStack {
                Image(systemName: "lock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20, alignment: .center)
                    .foregroundColor(.white)
                
                SecureField("", text: $text)
                    .placeholder(when: text.isEmpty) {
                        Text("\(placeholder)")
                            .foregroundColor(Color.white).opacity(1)
                    }
                    .foregroundColor(.white)
                    .padding(.leading, 10)
            }
        }
    }
}

struct CustomSecureField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            LinearGradient(colors: [Color.purple, Color.blue], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            CustomSecureField(text: .constant(""), placeholder: Text("Password"))

        }
    }
}
