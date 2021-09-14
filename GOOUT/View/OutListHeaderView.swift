//
//  OutListHeaderView.swift
//  GOOUT
//
//  Created by 노연주 on 2021/09/13.
//

import UIKit
import Then
import SnapKit

class OutListHeaderView: UIView {
    lazy var nameLabel = UILabel().then {
        $0.text = "이름"
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = .rgb(red: 104, green: 134, blue: 197)
    }
    
    lazy var gradeClassNumLabel = UILabel().then {
        $0.text = "학년/반/번호"
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = .rgb(red: 104, green: 134, blue: 197)
    }
    
    lazy var timeLabel = UILabel().then {
        $0.text = "외출 시간"
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = .rgb(red: 104, green: 134, blue: 197)
    }
    
    lazy var reasonLabel = UILabel().then {
        $0.text = "사유"
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = .rgb(red: 104, green: 134, blue: 197)
    }
    
    func HeaderViewSetting(screenHeight: CGFloat, screenWidth: CGFloat){
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(screenWidth/8)
        }
        
        gradeClassNumLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(nameLabel.snp.right).offset(screenWidth/10.32)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(gradeClassNumLabel.snp.right).offset(screenWidth/12.09)
        }
        
        reasonLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(timeLabel.snp.right).offset(screenWidth/11.27)
        }
    }
}
