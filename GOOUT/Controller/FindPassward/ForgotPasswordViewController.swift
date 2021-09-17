//
//  ForgotPasswordViewController.swift
//  GOOUT
//
//  Created by GSM07 on 2021/09/02.
//

import UIKit
import SnapKit
import Then
import Firebase

class ForgotPasswordViewController: UIViewController{
    
    var mainview = UIView()
    var mainlabel = UILabel()
    var passwordlabel = UILabel()
    var sublable = UILabel()
    var sublable2 = UILabel()
    var emailtext = UITextField()
    var checkbutton = UIButton()
    let border = CALayer()
    let bound = UIScreen.main.bounds
    
    var testViewController = TestViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
       configureUI()
      
     
        mainlabel.updateGradientTextColor_horizontal(gradientColors: [UIColor.rgb(red: 104, green: 134, blue: 197), UIColor.rgb(red: 255, green: 172, blue: 183)])
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
        view.addSubview(emailtext)
        view.addSubview(checkbutton)
    }
    
    @objc func checkbuttonClicked(sender:UIButton){
        verfi()
//        self.addChild(testViewController)
//        testViewController.view.frame = view.frame
//        self.view.addSubview(testViewController.view)
//
//        UIView.animate(withDuration: 0.3) {
//            self.passwordlabel.alpha = 0
//            self.sublable.alpha = 0
//            self.sublable2.alpha = 0
//            self.emailtext.alpha = 0
//            self.checkbutton.alpha = 0
//
//            self.testViewController.textfieldView.alpha = 1
//            self.testViewController.resendButton.alpha = 1
//            self.testViewController.certificationTextField.alpha = 1
//            self.testViewController.checkbutton.alpha = 1
//            self.testViewController.inputLabel.alpha = 1
//        }
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
        }
            
        passwordlabel.textColor = .white
        passwordlabel.dynamicFont(fontSize: 19, currentFontName: "AppleSDGothicNeo-Bold")
        passwordlabel.text = "비밀번호를 잊으셨나요?"
        passwordlabel.snp.makeConstraints{ make in
            make.top.equalTo(mainview.snp.top).offset(bound.height*0.11)
            make.centerX.equalTo(view)
        }
        
        sublable.textAlignment = .center
        sublable.textColor = .white
        sublable.dynamicFont(fontSize: 13, currentFontName: "AppleSDGothicNeo-SemiBold")
        sublable.text = "회원가입 시 사용하신 이메일을 입력해주세요."
        sublable.snp.makeConstraints{make in
            make.top.equalTo(mainview.snp.top).offset(bound.height*0.21)
            make.centerX.equalTo(view)
            
            
        }
        sublable2.textAlignment = .center
        sublable2.textColor = .white
        sublable2.dynamicFont(fontSize: 13, currentFontName: "AppleSDGothicNeo-SemiBold")
        sublable2.text = "이메일로 인증번호를 보내드리겠습니다."
        sublable2.snp.makeConstraints{make in
            make.top.equalTo(sublable.snp.bottom).offset(1)
            make.centerX.equalTo(view)
        }
        
        emailtext.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Light")
        self.emailtext.autocapitalizationType = .none
        emailtext.borderStyle = .none
        emailtext.layer.addSublayer(border)
        emailtext.attributedPlaceholder =  NSAttributedString(string: "이메일을 입력해주세요.", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        emailtext.textColor = .white
        
        emailtext.snp.makeConstraints{make in
            make.top.equalTo(passwordlabel.snp.bottom).offset(bound.height*0.2)
            make.left.equalTo(bound.width*0.18)
            
            make.width.equalTo(bound.width*0.65)
            make.height.equalTo(bound.height*0.03)
            
        }
        
        checkbutton.backgroundColor = .white
        checkbutton.layer.cornerRadius = 10
        checkbutton.setTitle("확인", for: .normal)
        checkbutton.setTitleColor(.gray, for: .normal)
        checkbutton.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-SemiBold")
        checkbutton.addTarget(self, action: #selector(checkbuttonClicked(sender:)), for: .touchUpInside)
        checkbutton.snp.makeConstraints{make in
            make.top.equalTo(emailtext.snp.bottom).offset(bound.height*0.05)
            make.centerX.equalTo(view)
        
            make.left.equalTo(bound.width*0.4)
            
            
            make.height.equalTo(bound.height*0.04)
            
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
    override func viewDidLayoutSubviews() {
        border.frame = CGRect(x: 0, y: bound.height*0.03, width: emailtext.frame.width, height: 1)
        border.backgroundColor = UIColor.white.cgColor
    }
    
    func verfi(){
        Service.getUser(email: emailtext.text ?? "") { um in
            Auth.auth().signIn(withEmail: um.email, password: um.password) { res, err in
                print(res?.user.uid ?? "")
                let controller = MainViewController()
                controller.modalPresentationStyle = .fullScreen
                
                DispatchQueue.main.async {
                    self.present(controller, animated: true, completion: nil)
                }
               
                
            }
        }
        
    }
    
}
