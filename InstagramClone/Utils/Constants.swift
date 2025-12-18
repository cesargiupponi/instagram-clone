//
//  Constants.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 18/12/25.
//

import Firebase

struct FirebaseConstants {
    static let Root = Firestore.firestore()

    static let UsersCollection = Root.collection("users")
    static let PostsCollection = Root.collection("posts")
}
