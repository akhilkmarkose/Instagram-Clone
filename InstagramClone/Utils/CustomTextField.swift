//
//  CustomTextField.swift
//  InstagramClone
//
//  Created by AKHIL KUNJUMON MARKOSE on 27/10/22.
//

import SwiftUI

struct CustomTextField: View {
    
    @Binding var text: String
    
    let placeholder: Text
    let imageName: String
    
    var body: some View {
        ZStack {
            HStack {
                
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20, alignment: .center)
                    .foregroundColor(.white)
                
                TextField("", text: $text)
                    .placeholder(when: text.isEmpty) {
                        Text("\(placeholder)")
                            .foregroundColor(.white).opacity(1)
                    }
                    .foregroundColor(.white)
                    .padding(.leading, 10)
            }
        }
    }
    
    struct CustomTextField_Previews: PreviewProvider {
        static var previews: some View {
            ZStack {
                LinearGradient(colors: [Color.purple, Color.blue], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                CustomTextField(text: .constant(""), placeholder: Text("Password"), imageName: "envelope")
            }
            
        }
    }
}
