//
//  RegistrationView.swift
//  InstagramClone
//
//  Created by AKHIL KUNJUMON MARKOSE on 27/10/22.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var userName = ""
    @State private var fullName = ""
    @State private var password = ""
    @State private var selectedImage: UIImage?
    @State var postImage: Image?
    @State var imagePickerPresented = false
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.purple, Color.blue], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(spacing: 20) {
                if let image = postImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 140, height: 140)
                        //.padding(.top)
                        .clipShape(Circle())
                        .clipped()
                } else {
                    Button {
                        imagePickerPresented.toggle()
                    } label: {
                        Image("plus")
                            .resizable()
                            .renderingMode(.template)
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.white)
                            .padding(.top)
                    }
                    .sheet(isPresented: $imagePickerPresented) {
                        loadImage()
                    } content: {
                        ImagePicker(image: $selectedImage)
                    }
                }
                
                VStack(spacing: 20) {
                    CustomTextField(text: $email, placeholder: Text("Email") , imageName: "envelope")
                        .padding([.top, .bottom, .leading], 10)
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .padding(.horizontal, 32)
                    
                    CustomTextField(text: $userName, placeholder: Text("Username") , imageName: "person")
                        .padding([.top, .bottom, .leading], 10)
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .padding(.horizontal, 32)
                    
                    CustomTextField(text: $fullName, placeholder: Text("Full Name") , imageName: "person")
                        .padding([.top, .bottom, .leading], 10)
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .padding(.horizontal, 32)
                    
                    CustomSecureField(text: $password, placeholder: Text("Password"))
                        .padding([.top, .bottom, .leading], 10)
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .padding(.horizontal, 32)

                    Button {
                        viewModel.register(withEmail: email, password: password, image: selectedImage, fullname: fullName, username: userName )
                    } label: {
                        Text("Sign Up")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(width: 330, height: 50)
                            .background(Color(.systemPurple))
                            .clipShape(Capsule())
                            .padding([.leading, .trailing], 10)
                    }

                    Spacer()

                }
                
                Button {
                    mode.wrappedValue.dismiss()

                } label: {
                    HStack {
                        Text("Already have an account?")
                            .font(.system(size: 14))
                        
                        Text("Sign In")
                            .font(.system(size: 14, weight: .semibold))
                    }
                    .foregroundColor(.white)
                }
                .padding(.bottom)
            }
        }
    }
}

extension RegistrationView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        postImage = Image(uiImage: selectedImage)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
