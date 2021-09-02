//
//  SignUpViewController.swift
//  GOOUT
//
//  Created by GSM02 on 2021/09/02.
//

import UIKit
import SnapKit
import Then

class SignUpViewController: UIViewController {
    
    lazy var signUpLabel = UILabel().then {
        $0.text = "Sign up"
        $0.dynamicFont(fontSize: 30, currentFontName: "FugazOne-Regular")
        $0.textColor = .rgb(red: 255, green: 172, blue: 183)
    }
    lazy var backgroundView = UIView().then {
        $0.backgroundColor = .rgb(red: 255, green: 243, blue: 243)
    }
    lazy var emailLabel = UILabel().then {
        $0.text = "Email"
        $0.dynamicFont(fontSize: 14, currentFontName: "Apple SD Gothic Neo-SemiBold")
        $0.textColor = .rgb(red: 255, green: 172, blue: 183)
    }
    lazy var passwordLabel = UILabel().then {
        $0.text = "Password"
        $0.dynamicFont(fontSize: 14, currentFontName: "Apple SD Gothic Neo-SemiBold")
        $0.textColor = .rgb(red: 255, green: 172, blue: 183)
    }
    lazy var checkPasswordLabel = UILabel().then {
        $0.text = "Check Password"
        $0.dynamicFont(fontSize: 14, currentFontName: "Apple SD Gothic Neo-SemiBold")
        $0.textColor = .rgb(red: 255, green: 172, blue: 183)
    }
    lazy var emailTextField = UITextField().then {
        $0.placeholder = "이메일을 입력하세요"
        $0.setPlaceholderColor(.rgb(red: 108, green: 108, blue: 108))
    }
    lazy var emailLine = UIView().then {
        $0.backgroundColor = .rgb(red: 255, green: 172, blue: 183)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
  
    func configureUI() {
        addSubView()
        cornerRadius()
        location()
    }
    
    func cornerRadius() {
        backgroundView.layer.cornerRadius = 50
        backgroundView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        backgroundView.layer.masksToBounds = true
    }
    
    func addSubView() {
        self.view.addSubview(signUpLabel)
        self.view.addSubview(backgroundView)
        self.view.addSubview(emailLabel)
        self.view.addSubview(passwordLabel)
        self.view.addSubview(checkPasswordLabel)
        self.view.addSubview(emailTextField)
        self.view.addSubview(emailLine)
    }
    
    func location() {
        signUpLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/7.96)
            make.left.equalToSuperview().offset(self.view.frame.width/8.52)
        }
        backgroundView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(1.33)
            make.top.equalToSuperview().offset(self.view.frame.height/4)
        }
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(backgroundView).offset(self.view.frame.height/10.15)
            make.left.equalToSuperview().offset(self.view.frame.width/5.95)
        }
        passwordLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/2.28)
            make.left.equalTo(emailLabel)
        }
        checkPasswordLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/1.85)
            make.left.equalTo(emailLabel)
        }
        emailTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/2.63)
            make.left.equalTo(emailLabel)
        }
        emailLine.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.5)
            make.height.equalToSuperview().dividedBy(812)
            make.top.equalToSuperview().offset(self.view.frame.height/2.46)
            make.centerX.equalToSuperview()
        }
        
        
    }
    
}

public extension UITextField {
    
    func setPlaceholderColor(_ placeholderColor: UIColor) {
        attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "",
            attributes: [
                .foregroundColor: placeholderColor,
                .font: font
            ].compactMapValues { $0 }
        )
    }
}



//MARK: - Preview

#if DEBUG
import SwiftUI
struct SignUpViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        SignUpViewController()
    }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            SignUpViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif
