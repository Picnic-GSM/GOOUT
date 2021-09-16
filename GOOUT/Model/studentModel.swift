//
//  studentModel.swift
//  GOOUT
//
//  Created by baegteun on 2021/09/16.
//

import Foundation

struct studentModel: Codable{
    let name: String
    let email: String
    let password: String
    let grade: Int
    let `class`: Int
    let s_number: Int
}
