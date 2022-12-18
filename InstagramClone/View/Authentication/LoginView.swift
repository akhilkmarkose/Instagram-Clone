//
//  LoginView.swift
//  InstagramClone
//
//  Created by AKHIL KUNJUMON MARKOSE on 27/10/22.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        
        NavigationView {
            ZStack {
                LinearGradient(colors: [Color.purple, Color.blue], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack {
                    Image("Instagram_logo")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFit()
                        .frame(width: 220, height: 100)
                        .foregroundColor(.white)
                        .padding(.top, 30)
                    
                    VStack(spacing: 20) {
                        CustomTextField(text: $email, placeholder: Text("Email") , imageName: "envelope")
                            .padding([.top, .bottom, .leading], 10)
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .padding(.horizontal, 32)
                        
                        CustomSecureField(text: $password, placeholder: Text("Password"))
                            .padding([.top, .bottom, .leading], 10)
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .padding(.horizontal, 32)
                        
                        HStack {
                            Spacer()
                            
                            Button(action: {
                                
                            }, label: {
                                Text("Forgot Passoword?")
                                    .font(.system(size: 13, weight: .semibold))
                                    .foregroundColor(.white)
                                    .padding(.trailing, 32)
                            })
                        }
                        
                        Button {
                            viewModel.login(withEmail: email, password: password)
                        } label: {
                            Text("Sign In")
                                .foregroundColor(.white)
                                .font(.headline)
                                .frame(width: 330, height: 50)
                                .background(Color(.systemPurple))
                                .clipShape(Capsule())
                                .padding([.leading, .trailing], 10)

                        }
                        
                        Spacer()
                        
                        NavigationLink {
                            RegistrationView().navigationBarHidden(true)
                            
                        } label: {
                            HStack {
                                Text("Don't have an account?")
                                    .font(.system(size: 14))
                                
                                Text("Sign Up")
                                    .font(.system(size: 14, weight: .semibold))
                            }
                            .foregroundColor(.white)
                        }
                        .padding(.bottom)
                    }
                    
                    Spacer()
                    
                }
                
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
