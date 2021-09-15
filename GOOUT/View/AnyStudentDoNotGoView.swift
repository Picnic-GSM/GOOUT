//
//  AnyStudentDoNotGoView.swift
//  GOOUT
//
//  Created by 노연주 on 2021/09/10.
//

import UIKit
import Then
import SnapKit

class AnyStudentDoNotGoView: UIView{
    lazy var notGoImage = UIImageView().then {
        $0.image = UIImage(named: "GOOUT_AnyStudentDoNotGoImage")
        $0.contentMode = .scaleAspectFit
    }
    
    lazy var noStudentLabel = UILabel().then {
        $0.text = "오늘 외출, 조퇴한 학생이 없네요!"
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    func doNotGoViewSetting(screenHeight: CGFloat){
        notGoImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.28)
            make.height.equalToSuperview().dividedBy(4.14)
        }
        
        noStudentLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(notGoImage.snp.bottom).offset(screenHeight/36.91)
        }
    }
}
