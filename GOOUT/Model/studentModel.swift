//
//  studentModel.swift
//  GOOUT
//
//  Created by baegteun on 2021/09/16.
//

import Foundation

struct studentModel: Codable{
    var name: String
    var email: String
    var password: String
    var grade: Int
    var `class`: Int
    var s_number: Int
    var token: String = ""
}
