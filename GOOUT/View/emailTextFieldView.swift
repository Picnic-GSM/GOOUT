//
//  emailTextFieldView.swift
//  GOOUT
//
//  Created by GSM02 on 2021/09/09.
//

import UIKit
import SnapKit
import Then

class emailTextFieldView: UIView, UITextFieldDelegate {
    
    lazy var label = UILabel().then {
        $0.text = "Email"
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = .rgb(red: 255, green: 172, blue: 183)
    }
    
    lazy var textField = UITextField().then {
        $0.placeholder = "이메일을 입력하세요."
        $0.setPlaceholderColor(.rgb(red: 108, green: 108, blue: 108))
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.delegate = self
    }
    
    lazy var line = UIView().then {
        $0.backgroundColor = .rgb(red: 255, green: 172, blue: 183)
    }
    
    func emailTextFieldSetting(screenHeight: CGFloat, screenWidth: CGFloat) {
        label.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        textField.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(screenHeight/90.22)
            make.left.equalTo(label)
        }
        
        line.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.5)
            make.height.equalToSuperview().dividedBy(812)
            make.top.equalTo(label.snp.bottom).offset(screenHeight/24.61)
            make.centerX.equalToSuperview()
        }
    }
    
}
