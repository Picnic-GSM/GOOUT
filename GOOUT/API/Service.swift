//
//  Service.swift
//  GOOUT
//
//  Created by baegteun on 2021/09/16.
//

import Foundation
import Firebase

class Service{
    static func getUser(_ uid: String,completion: @escaping(userModel) -> Void){
        let db = Firestore.firestore()
        db.collection("users").whereField("uid", isEqualTo: uid).getDocuments{ snapshot, err in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            let model = userModel(dict: snapshot!.documents[0].data())
            completion(model)
        }
        
        
    }
    
    static func getUser(email: String, completion: @escaping(userModel) -> Void){
        let db = Firestore.firestore()
        db.collection("users").whereField("email", isEqualTo: email).getDocuments { snapshot, err in
            if let err = err{
                print(err.localizedDescription)
                return
            }
            let model = userModel(dict: snapshot!.documents[0].data())
            completion(model)
        }
    }
}
