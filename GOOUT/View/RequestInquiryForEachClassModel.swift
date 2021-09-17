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

//MARK: - 외출 조퇴 요청 확인 CollectionView 정보
struct GoingOutEarlyLeaveCellModel{
    let earlyTextType : GoingOutLeavingEarlyText
    let name : String
    let number : Int
    let time : receivedTime
    let reason : String?
}


struct receivedTime{
    let startClock : time?
    let finishClock : time?
}


struct time{
    let oclock : Int?
    let minute : Int?
}

//MARK: - 귀가완료 tableView 정보
struct FinishedGoingHome {
    let name : String?
    let number : Int?
    let time : receivedTime?
    let btnTitle : FinishedGoingHomeStatus
}
enum FinishedGoingHomeStatus : String{
    case completeGoingHome = "귀가 완료"
    case cancelGoingHome = "귀가 취소"
}

//MARK: - StatusColor
extension UIColor{
    struct FinishGoingHomeColor {
        static let GOOUT_red = UIColor.rgb(red: 255, green: 107, blue: 107)
        static let GOOUT_yellow = UIColor.rgb(red: 255, green: 205, blue: 107)
        static let GOOUT_Green = UIColor.rgb(red: 156, green: 198, blue: 160)
    }
    struct GoingOutEarlyLeave{
        static let GOOUT_blue = UIColor.rgb(red: 104, green: 134, blue: 197)
        static let GOOUT_red = UIColor.rgb(red: 242, green: 133, blue: 148)
    }
}
