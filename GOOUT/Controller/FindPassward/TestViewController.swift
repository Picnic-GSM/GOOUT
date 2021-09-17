//
//  TestViewController.swift
//  GOOUT
//
//  Created by GSM03 on 2021/09/09.
//

import UIKit

class TestViewController: UIViewController{
    
    let mainView = UIView()
    let bound = UIScreen.main.bounds


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
        ckbtn.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-SemiBold")
        ckbtn.layer.masksToBounds = true
    }
    
    var certificationTextField = UITextField().then { text in
        text.backgroundColor = .white
        text.layer.cornerRadius = 8
        text.layer.masksToBounds = true
        text.textColor = UIColor.rgb(red: 158, green: 158, blue: 158)
        text.textAlignment = .center
        text.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    var showBackgroundView = UIView().then{
        $0.backgroundColor = .white
        $0.alpha = 0.3
        $0.layer.cornerRadius = 15
    }
    
    var textfieldView = UIView().then{
        $0.backgroundColor = .white
    }
    
    var goToLoginButton = UIButton().then { ckbtn in
        ckbtn.backgroundColor = .white
        ckbtn.setTitle("로그인 화면으로", for: .normal)
        ckbtn.setTitleColor(UIColor(red: 0.438, green: 0.438, blue: 0.438, alpha: 1), for: .normal)
        ckbtn.layer.cornerRadius = 10
        ckbtn.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-SemiBold")
        ckbtn.layer.masksToBounds = true
    }
    
    var showPasswardLabel = UILabel().then{
        $0.text = "회원님의 비밀번호는 1345** 입니다."
        $0.textColor = .white
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    @objc func checkbuttonClicked(sender:UIButton){
        UIView.animate(withDuration: 0.3) {
            self.resendButton.alpha = 0
            self.inputLabel.alpha = 0
            self.checkbutton.alpha = 0
            self.certificationTextField.alpha = 0
            self.textfieldView.alpha = 0
            
            self.showPasswardLabel.alpha = 1
            self.goToLoginButton.alpha = 1
            self.showBackgroundView.alpha = 0.3
            

            
        }
        
        self.view.addSubview(self.showPasswardLabel)
        
        self.showPasswardLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    @objc func goToLoginButtonClicked(sender:UIButton){
        let nextVC = SigninViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(resendButton)
        self.view.addSubview(inputLabel)
        self.view.addSubview(checkbutton)
        self.view.addSubview(textfieldView)
        self.view.addSubview(showBackgroundView)
        self.view.addSubview(goToLoginButton)
        textfieldView.addSubview(certificationTextField)
        
        checkbutton.addTarget(self, action: #selector(checkbuttonClicked(sender:)), for: .touchUpInside)
        goToLoginButton.addTarget(self, action: #selector(goToLoginButtonClicked(sender:)), for: .touchUpInside)
        
        resendButton.alpha = 0
        inputLabel.alpha = 0
        checkbutton.alpha = 0
        certificationTextField.alpha = 0
        textfieldView.alpha = 0
        
        textfieldView.layer.cornerRadius = 8
        
        resendButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/2.7)
            make.right.equalToSuperview().offset(-self.view.frame.width/4.31)
            make.width.equalToSuperview().dividedBy(8.41)
            make.height.equalToSuperview().dividedBy(54.13)
        }
        
        resendButton.layer.cornerRadius = self.view.frame.height/54.13/2
        
        inputLabel.snp.makeConstraints { make in
            make.top.equalTo(resendButton.snp.bottom).offset(self.view.frame.height/29)
            make.centerX.equalToSuperview()
        }
        
        textfieldView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(inputLabel.snp.bottom).offset(self.view.frame.height/29)
            make.width.equalToSuperview().dividedBy(1.93)
            make.height.equalToSuperview().dividedBy(19.33)
        }
        
        certificationTextField.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalToSuperview().dividedBy(1.5)
        }
        
        checkbutton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(certificationTextField.snp.bottom).offset(self.view.frame.height/30)
            make.width.equalToSuperview().dividedBy(4.92)
            make.height.equalToSuperview().dividedBy(27.06)
        }
        
        showBackgroundView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.6)
            make.height.equalToSuperview().dividedBy(9)
        }
        
        goToLoginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-self.view.frame.height/2.7)
            make.width.equalToSuperview().dividedBy(3)
            make.height.equalToSuperview().dividedBy(27.06)
        }
        
        showPasswardLabel.alpha = 0
        goToLoginButton.alpha = 0
        showBackgroundView.alpha = 0
        
    }
    
}



