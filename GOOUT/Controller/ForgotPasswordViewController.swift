//
//  ForgotPasswordViewController.swift
//  GOOUT
//
//  Created by GSM07 on 2021/09/02.
//

import UIKit
import SnapKit
import Then

class ForgotPasswordViewController: UIViewController{
    
    var mainview = UIView()
    var mainlabel = UILabel()
    var passwordlabel = UILabel()
    var sublable = UILabel()
    var sublable2 = UILabel()
    let bound = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
       configureUI()
      
     
            
        }
        
    
    
    func configureUI(){
        addview()
        gradient()
        location()
    }
    
    func addview(){
        view.addSubview(mainview)
        view.addSubview(mainlabel)
        view.addSubview(passwordlabel)
        view.addSubview(sublable)
        view.addSubview(sublable2)
    }
    
    func location(){
        mainview.snp.makeConstraints{ make in
            
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(bound.height*0.74)
            make.top.equalTo(bound.height*0.25)
    }
        
        mainlabel.text = "Find Password"
        mainlabel.dynamicFont(fontSize: 25, currentFontName: "FugazOne-Regular")
        mainlabel.snp.makeConstraints{ mak in
            mak.top.equalTo(bound.height*0.12)
            mak.left.equalTo(bound.width*0.11)
            mak.height.equalTo(bound.height*0.03)
            mak.width.equalTo(bound.width*0.488)
            
            
        passwordlabel.textColor = .white
        passwordlabel.dynamicFont(fontSize: 22, currentFontName: "AppleSDGothicNeo-Bold")
        passwordlabel.text = "비밀번호를 잊으셨나요?"
        passwordlabel.snp.makeConstraints{ make in
                make.top.equalTo(mainview.snp.top).offset(bound.height*0.11)
                make.centerX.equalTo(view)
                
            
            sublable.textAlignment = .center
            sublable.textColor = .white
            sublable.dynamicFont(fontSize: 16, currentFontName: "AppleSDGothicNeo-SemiBold")
            sublable.text = "회원가입 시 사용하신 이메일을 입력해주세요."
            sublable.snp.makeConstraints{make in
                make.top.equalTo(mainview.snp.top).offset(bound.height*0.21)
                make.centerX.equalTo(view)
                
                
            }
            sublable2.textAlignment = .center
            sublable2.textColor = .white
            sublable2.dynamicFont(fontSize: 16, currentFontName: "AppleSDGothicNeo-SemiBold")
            sublable2.text = "이메일로 인증번호를 보내드리겠습니다."
            sublable2.snp.makeConstraints{make in
                make.top.equalTo(sublable.snp.bottom).offset(1)
                make.centerX.equalTo(view)
            }
            }
        }
    }
    func gradient(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            UIColor(red: 0.408, green: 0.525, blue: 0.773, alpha: 1.1).cgColor,

              UIColor(red: 1, green: 0.675, blue: 0.718, alpha: 1).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.cornerRadius = 55
        gradientLayer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)
        
        mainview.layer.addSublayer(gradientLayer)
   
    
        
    }
    func gradientColor(gradientLayer :CAGradientLayer) -> UIColor? {
        UIGraphicsBeginImageContextWithOptions(gradientLayer.bounds.size, false, 0.0)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return UIColor(patternImage: image!)
    }

 
    }

