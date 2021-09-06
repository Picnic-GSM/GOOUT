//
//  RequestInquiryForEachClassModel.swift
//  GOOUT
//
//  Created by Ji-hoon Ahn on 2021/08/31.
//

import UIKit

enum GoingOutLeavingEarlyText : String{
    case goingOut = "외출 요청"
    case leavingEarly = "조퇴 요청"
}
protocol FormViewModel {
    func updateForm()
}
protocol  TableViewDataViewModel{
    var formIsValid : Bool{get}
    var NoData : Bool{get}
    var statusColor : UIColor{get}
    var GoingOutLeavingEarly : UIColor{get}
    
}
