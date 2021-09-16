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
        db.collection("users").document(uid).getDocument { snapshot, err in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            let model = userModel(dict: snapshot!.data()!)
            completion(model)
        }
    }
}
