//
//  userModel.swift
//  GOOUT
//
//  Created by baegteun on 2021/09/16.
//

import Foundation

struct userModel{
    var name: String
    var email:String
    var password: String
    var grade: Int
    var `class`: Int
    var s_number: Int
    var uid: String
    init(dict: [String:Any]){
        self.name = dict["name"] as? String ?? ""
        self.email = dict["email"] as? String ?? ""
        self.password = dict["password"] as? String ?? ""
        self.grade = dict["grade"] as? Int ?? 1
        self.class = dict["class"] as? Int ?? 1
        self.s_number = dict["s_number"] as? Int ?? 1
        self.uid = dict["uid"] as? String ?? ""
        
    }
}
