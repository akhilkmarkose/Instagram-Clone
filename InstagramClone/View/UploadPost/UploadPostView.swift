//
//  UploadPostView.swift
//  InstagramClone
//
//  Created by AKHIL KUNJUMON MARKOSE on 20/10/22.
//

import SwiftUI

struct UploadPostView: View {
    @State private var selectedImage: UIImage?
    @State var postImage: Image?
    @State var captionText = ""
    @State var imagePickerPresented = false
    @Binding var tabIndex: Int
    @ObservedObject var viewModel = uploadPostViewModel()
    
    var body: some View {
        VStack {
            if postImage == nil {
                Button {
                    imagePickerPresented.toggle()
                } label: {
                    
                    Image("plus")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFill()
                        .foregroundColor(.black)
                        .frame(width: 180, height: 180)
                        .clipped()
                        .padding(.top, 56)
                }
                .sheet(isPresented: $imagePickerPresented) {
                    loadImage()
                } content: {
                    ImagePicker(image: $selectedImage)
                }

            } else if let image = postImage {
                HStack(alignment: .top) {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96, height: 96)
                        .clipped()
                    
                    //TextField("Enter your caption..", text: $captionText)
                    ZStack(alignment: .topLeading) {
                        TextEditor(text: $captionText)
                            .frame(height: 200, alignment: .center)
                            //.border(.black, width: 3)
                            .foregroundColor(captionText.isEmpty ? Color(uiColor: .red) : Color(uiColor: .darkText))

                        if captionText.isEmpty {
                            Text("Enter some caption...")
                                .padding(.top, 8).padding(.leading, 5)
                                .frame(height: 96, alignment: .top)
                                //.border(.red, width: 1)
                                .foregroundColor(Color(uiColor: .placeholderText))
                        }
                    }
                    
//                    TextArea(text: $captionText, placeholder: "enter your caption...")
//                        .frame(height: 200)

                }
                .padding()
                
                HStack(spacing: 16) {
                    Button {
                        captionText = ""
                        postImage = nil
                    } label: {
                       Text("Cancel")
                            .font(.system(size: 16, weight: .semibold))
                            .frame(width: 172, height: 50)
                            .background(Color.red)
                            .cornerRadius(5)
                            .foregroundColor(.white)
                    }
                    
                    Button {
                        if let image = selectedImage {
                            viewModel.uploadPost(caption: captionText, image: image) { _ in
                                print("DEBUGGER: post successfully uploaded...")
                                captionText = ""
                                postImage = nil
                                tabIndex = 0
                            }

                        }
                    } label: {
                       Text("Share")
                            .font(.system(size: 16, weight: .semibold))
                            .frame(width: 172, height: 50)
                            .background(Color.blue)
                            .cornerRadius(5)
                            .foregroundColor(.white)
                    }
                }
            }
    
            
            Spacer()
        }
    }
}

extension UploadPostView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        postImage = Image(uiImage: selectedImage)
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView(tabIndex: .constant(0))
    }
}
