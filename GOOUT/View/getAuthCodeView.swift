//
//  getAuthCodeView.swift
//  GOOUT
//
//  Created by GSM03 on 2021/09/09.
//

import UIKit
import SnapKit
import Then
import AEOTPTextField

class getAuthCodeView: UIView{
    
    var mainview = UIView()

    var resendButton = UIButton().then {btn in
        btn.backgroundColor = .white
        btn.setTitle("재전송", for: .normal)
        btn.setTitleColor(UIColor(red: 0.329, green: 0.329, blue: 0.329, alpha: 1), for: .normal)
        btn.dynamicFont(fontSize: 8, currentFontName: "AppleSDGothicNeo-SemiBold")
        btn.layer.masksToBounds = true
    }
    var inputLabel = UILabel().then {label1 in
        label1.backgroundColor = .clear
        label1.text = "인증번호를 입력해주세요."
        label1.textColor = .white
        label1.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    var checkbutton = UIButton().then { ckbtn in
        ckbtn.backgroundColor = .white
        ckbtn.setTitle(" 확인 ", for: .normal)
        ckbtn.setTitleColor(UIColor(red: 0.438, green: 0.438, blue: 0.438, alpha: 1), for: .normal)
        ckbtn.layer.cornerRadius = 10
        ckbtn.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-SemiBold")
        ckbtn.layer.masksToBounds = true
    }
    
    var certificationTextField = UITextField().then { text in
        text.backgroundColor = .white
        text.layer.cornerRadius = 8
        text.layer.masksToBounds = true
        
    }
   
    
        
    let bound = UIScreen.main.bounds
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layoutSetting()
        gradient()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        super.init(frame:frame)
        
        layoutSetting()
        gradient()
    }
    
    func layoutSetting(){
        self.addSubview(mainview)
        mainview.addSubview(resendButton)
        mainview.addSubview(inputLabel)
        mainview.addSubview(certificationTextField)
        mainview.addSubview(checkbutton)
        mainview.backgroundColor = .blue
        mainview.roundCorners(cornerRadius: 55, maskedCorners: [.layerMinXMinYCorner,.layerMaxXMinYCorner])
        
        mainview.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(bound.height*0.74)
            make.bottom.equalToSuperview()
        }
        
        mainview.clipsToBounds = true
    }
    
    func gradient(){
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.74))
                let gradient = CAGradientLayer()

                gradient.frame = view.bounds
                gradient.colors = [UIColor(red: 255/255, green: 173/255, blue: 172/255, alpha: 1).cgColor, UIColor(red: 104/255, green: 134/255, blue: 197/255, alpha: 1).cgColor]
                gradient.locations = [0.0 , 1.0]
                gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
                gradient.endPoint = CGPoint(x: 1.0, y: 1.0)

                mainview.layer.insertSublayer(gradient, at: 0)
    }
}
