//
//  Constants.swift
//  InstagramClone
//
//  Created by AKHIL KUNJUMON MARKOSE on 09/11/22.
//

import Firebase

// prefix for handling "users" information from firestore
let COLLECTION_USERS = Firestore.firestore().collection("users")

// prefix for handling "followed users" information from firestore
let COLLECTION_FOLLOWERS = Firestore.firestore().collection("followers")

// prefix for handling "following users" information from firestore
let COLLECTION_FOLLOWING = Firestore.firestore().collection("following")

// prefix for handling "posts" to the firestore
let COLLECTION_POSTS = Firestore.firestore().collection("posts")

