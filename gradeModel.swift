//
//  gradeModel.swift
//  GOOUT
//
//  Created by baegteun on 2021/09/16.
//

import Foundation

struct gradeModel {
    var name: String
    var status: Int
    var kind: String
    var grade: Int
    var classNumber: String
    var startTime: String
    var endTime: String
    var reason: String
    var access: Bool
    var completed: Int
    var onClear: Bool
    var uid: String
    
    init(dict: [String:Any]){
        self.name = dict["name"] as? String ?? ""
        self.status = dict["status"] as? Int ?? 1
        self.kind = dict["kind"] as? String ?? ""
        self.grade = dict["grade"] as? Int ?? 3
        self.classNumber = dict["classNumber"] as? String ?? ""
        self.startTime = dict["startTime"] as? String ?? ""
        self.endTime = dict["endTime"] as? String ?? ""
        self.reason = dict["reason"] as? String ?? ""
        self.access = dict["access"] as? Bool ?? false
        self.completed = dict["completed"] as? Int ?? 0
        self.onClear = dict["onClear"] as? Bool ?? false
        self.uid = dict["uid"] as? String ?? ""
    }
}
