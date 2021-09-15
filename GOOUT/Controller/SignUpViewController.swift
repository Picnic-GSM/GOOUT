//
//  SignUpViewController.swift
//  GOOUT
//
//  Created by GSM02 on 2021/09/02.
//

import UIKit
import SnapKit
import Then

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
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
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = .rgb(red: 255, green: 172, blue: 183)
    }
    
    lazy var emailTextField = UITextField().then {
        $0.placeholder = "이메일을 입력하세요."
        $0.setPlaceholderColor(.rgb(red: 108, green: 108, blue: 108))
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.delegate = self
    }
    
    lazy var emailLine = UIView().then {
        $0.backgroundColor = .rgb(red: 255, green: 172, blue: 183)
    }
    
    lazy var passwordLabel = UILabel().then {
        $0.text = "Password"
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = .rgb(red: 255, green: 172, blue: 183)
    }
    
    lazy var passwordTextField = UITextField().then {
        $0.placeholder = "비밀번호를 입력하세요."
        $0.setPlaceholderColor(.rgb(red: 108, green: 108, blue: 108))
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.isSecureTextEntry = true
        $0.delegate = self
    }
    
    lazy var passwordLine = UIView().then {
        $0.backgroundColor = .rgb(red: 255, green: 172, blue: 183)
    }
    
    lazy var passwordVisibilityButton = UIButton().then {
        $0.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        $0.tintColor = .rgb(red: 108, green: 108, blue: 108)
        $0.addTarget(self, action: #selector(changePasswordVisibilityToggle), for: .touchUpInside)
    }
    
    lazy var passwordExampleLabel = UILabel().then {
        $0.text = "비밀번호는 8~16자 사이로, 특수문자를 포함해야합니다."
        $0.textColor = .rgb(red: 151, green: 151, blue: 151)
        $0.dynamicFont(fontSize: 8, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    lazy var checkPasswordLabel = UILabel().then {
        $0.text = "Check Password"
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = .rgb(red: 255, green: 172, blue: 183)
    }
    
    lazy var checkPasswordTextField = UITextField().then {
        $0.placeholder = "비밀번호를 한번 더 입력하세요."
        $0.setPlaceholderColor(.rgb(red: 108, green: 108, blue: 108))
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.isSecureTextEntry = true
        $0.delegate = self
    }
    
    lazy var checkPasswordLine = UIView().then {
        $0.backgroundColor = .rgb(red: 255, green: 172, blue: 183)
    }
    
    lazy var teacherButton = UIButton().then {
        $0.setTitle("선생님이신가요?", for: .normal)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.setTitleColor(.rgb(red: 118, green: 118, blue: 118), for: .normal)
    }
    
    lazy var signUpButton = UIButton().then {
        $0.setTitle("Sign up", for: .normal)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.backgroundColor = .rgb(red: 255, green: 172, blue: 183)
        $0.addTarget(self, action: #selector(clickSignUpButton), for: .touchUpInside)
    }
    
    lazy var loginButton = UIButton().then {
        $0.setTitle("이미 계정이 있으신가요?", for: .normal)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.setTitleColor(.rgb(red: 118, green: 118, blue: 118), for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    @objc func loginButtonClicked(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func teacherButtonClicked(sender:UIButton){
        let nextVC = EnterDistributioncode()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
  
//  MARK: configureUI
    func configureUI() {
        self.view.backgroundColor = .white
        addSubView()
        cornerRadius()
        location()
        shadow()
        addTarget()
    }
    
//  MARK: addTarget
    func addTarget(){
        loginButton.addTarget(self, action: #selector(loginButtonClicked(sender:)), for: .touchUpInside)
        teacherButton.addTarget(self, action: #selector(teacherButtonClicked(sender:)), for: .touchUpInside)
    }
    
//  MARK: shadow
    func shadow() {
        backgroundView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        backgroundView.layer.shadowOpacity = 1
        backgroundView.layer.shadowRadius = 10
        backgroundView.layer.shadowOffset = CGSize(width: 0, height: 4)
        backgroundView.clipsToBounds = false
    }
    
//  MARK: cornerRadius
    func cornerRadius() {
        backgroundView.layer.cornerRadius = 50
        backgroundView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        backgroundView.layer.masksToBounds = true
        signUpButton.layer.cornerRadius = 8
    }
    
//  MARK: addSubView
    func addSubView() {
        self.view.addSubview(signUpLabel)
        self.view.addSubview(backgroundView)
        self.view.addSubview(emailLabel)
        self.view.addSubview(emailTextField)
        self.view.addSubview(emailLine)
        self.view.addSubview(passwordLabel)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(passwordLine)
        self.view.addSubview(passwordVisibilityButton)
        self.view.addSubview(checkPasswordLabel)
        self.view.addSubview(checkPasswordTextField)
        self.view.addSubview(checkPasswordLine)
        self.view.addSubview(passwordExampleLabel)
        self.view.addSubview(teacherButton)
        self.view.addSubview(signUpButton)
        self.view.addSubview(loginButton)
    }

//  MARK: location
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
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(self.view.frame.height/90.22)
            make.left.equalTo(emailLabel)
        }
        
        emailLine.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.5)
            make.height.equalToSuperview().dividedBy(812)
            make.top.equalTo(emailLabel.snp.bottom).offset(self.view.frame.height/24.61)
            make.centerX.equalToSuperview()
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(backgroundView).offset(self.view.frame.height/5.31)
            make.left.equalTo(emailLabel)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(self.view.frame.height/90.22)
            make.left.equalTo(passwordLabel)
        }
        
        passwordLine.snp.makeConstraints { make in
            make.width.height.equalTo(emailLine)
            make.top.equalTo(passwordLabel.snp.bottom).offset(self.view.frame.height/24.61)
            make.centerX.equalToSuperview()
        }
        
        passwordVisibilityButton.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(25)
            make.height.equalToSuperview().dividedBy(90.22)
            make.top.equalTo(passwordLabel.snp.bottom).offset(self.view.frame.height/52.39)
            make.left.equalToSuperview().offset(self.view.frame.width/1.26)
        }
        
        passwordExampleLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(self.view.frame.height/20.82)
            make.left.equalTo(passwordLabel)
        }
        
        checkPasswordLabel.snp.makeConstraints { make in
            make.top.equalTo(backgroundView).offset(self.view.frame.height/3.44)
            make.left.equalTo(emailLabel)
        }
        
        checkPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(checkPasswordLabel.snp.bottom).offset(self.view.frame.height/90.22)
            make.left.equalTo(passwordLabel)
        }
        
        checkPasswordLine.snp.makeConstraints { make in
            make.width.height.equalTo(emailLine)
            make.top.equalTo(checkPasswordLabel.snp.bottom).offset(self.view.frame.height/24.61)
            make.centerX.equalToSuperview()
        }
        
        teacherButton.snp.makeConstraints { make in
            make.top.equalTo(checkPasswordLabel.snp.bottom).offset(self.view.frame.height/19.33)
            make.left.equalTo(checkPasswordLabel)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.5)
            make.height.equalToSuperview().dividedBy(21.37)
            make.top.equalTo(teacherButton.snp.bottom).offset(self.view.frame.height/25.38)
            make.centerX.equalToSuperview()
        }
        
        loginButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(self.view.frame.height/13.31)
            make.centerX.equalToSuperview()
        }
    }
  
    
//MARK: - Actions
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
          guard let text = passwordTextField.text else { return true }
        let newLength = text.count + string.count - range.length
          return newLength <= 16
    }
    
    @objc
    func changePasswordVisibilityToggle(_ sender : UIButton) {
        if passwordTextField.isSecureTextEntry{
            sender.setImage(UIImage(systemName: "eye"), for: .normal)
        }else{
            sender.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        }
        passwordTextField.isSecureTextEntry.toggle()
        checkPasswordTextField.isSecureTextEntry.toggle()
    }
    
    @objc
    func clickSignUpButton(_ sender: UIButton) {
        if emailTextField.text?.isEmpty == false &&
            passwordTextField.text?.isEmpty == false &&
            checkPasswordTextField.text?.isEmpty == false
        {
            if emailTextField.text?.contains("@") == true &&
                emailTextField.text?.contains(".") == true
            {
                if passwordTextField.text!.count >= 8 &&
                    passwordTextField.text?.contains("!") == true ||
                    passwordTextField.text?.contains("@") == true ||
                    passwordTextField.text?.contains("#") == true ||
                    passwordTextField.text?.contains("$") == true ||
                    passwordTextField.text?.contains("*") == true
                {
                    if checkPasswordTextField.text == passwordTextField.text{
                        print("성공")
                        
                        let nextVC = InformationViewController()
                        self.navigationController?.pushViewController(nextVC, animated: true)
                        
                        emailTextField.text = ""
                        passwordTextField.text = ""
                        checkPasswordTextField.text = ""
                        
                    }else{
                        print("비밀번호가 일치하지 않습니다.")
                    }
                }else{
                    print("비밀번호를 바르게 입력하세요")
                }
            }else{
                print("이메일을 바르게 입력하세요")
            }
        }else{
            print("모두 입력하세요")
        }
    }
}
