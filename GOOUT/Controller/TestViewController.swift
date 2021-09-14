//
//  TestViewController.swift
//  GOOUT
//
//  Created by GSM03 on 2021/09/09.
//

import UIKit

class TestViewController: UIViewController{
    var myGetAuthCodeView = getAuthCodeView()
    let bound = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(myGetAuthCodeView)
        myGetAuthCodeView.resendButton.layer.cornerRadius = self.view.frame.width/55
        myGetAuthCodeView.resendButton.clipsToBounds = true
        self.view.backgroundColor = .white
        
        myGetAuthCodeView.snp.makeConstraints { make in
            make.bottom.right.left.equalToSuperview()
            make.height.equalToSuperview().dividedBy(1.7)
        }
        //resendbutton
        myGetAuthCodeView.resendButton.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(9.15)
            make.height.equalToSuperview().dividedBy(40.6)

            make.left.equalToSuperview().offset(self.view.frame.width/1.48)
            make.top.equalToSuperview().offset(self.view.frame.height/13.76)
        }
        
        
        //inputlabel
        myGetAuthCodeView.inputLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(myGetAuthCodeView.resendButton).offset(self.view.frame.height/18.88)
        }
        //checkbutton
        myGetAuthCodeView.checkbutton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(myGetAuthCodeView.resendButton).offset(self.view.frame.height/5.03)
            make.width.equalToSuperview().dividedBy(5.35)
        }
        
        //TextFeild
        myGetAuthCodeView.certificationTextField.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(myGetAuthCodeView.inputLabel).offset(self.view.frame.height/21.75)
            make.width.equalToSuperview().dividedBy(2.1)
            make.height.equalToSuperview().dividedBy(14.5)
        }
        
    }
    
}



