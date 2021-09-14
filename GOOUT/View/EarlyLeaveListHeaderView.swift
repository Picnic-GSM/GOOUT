//
//  EarlyLeaveListHeaderView.swift
//  GOOUT
//
//  Created by 노연주 on 2021/09/13.
//

import UIKit
import Then
import SnapKit

class EarlyLeaveListHeaderView: UIView {
    lazy var nameLabel = UILabel().then {
        $0.text = "이름"
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = .rgb(red: 255, green: 172, blue: 183)
    }
    
    lazy var gradeClassNumLabel = UILabel().then {
        $0.text = "학년/반/번호"
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = .rgb(red: 255, green: 172, blue: 183)
    }
    
    lazy var reasonLabel = UILabel().then {
        $0.text = "조퇴사유"
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = .rgb(red: 255, green: 172, blue: 183)
    }
    
    func HeaderViewSetting(screenHeight: CGFloat, screenWidth: CGFloat){
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(screenWidth/11.5)
        }
        
        gradeClassNumLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(nameLabel.snp.right).offset(screenWidth/9.38)
        }
        
        reasonLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(gradeClassNumLabel.snp.right).offset(screenWidth/5)
        }
    }
}

