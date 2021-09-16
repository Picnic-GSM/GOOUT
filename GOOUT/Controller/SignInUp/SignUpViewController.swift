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
    
    lazy var emailContainer = emailTextFieldView()
    
    
    lazy var passwordContainer = emailTextFieldView().then {
        $0.label.text = "Password"
        $0.textField.isSecureTextEntry = true
        $0.textField.placeholder = "비밀번호를 입력하세요"
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
    
    lazy var checkPasswordContainer = emailTextFieldView().then {
        $0.label.text = "Check Password"
        $0.textField.isSecureTextEntry = true
        $0.textField.placeholder = "비밀번호를 한번 더 입력하세요."
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
  
//  MARK: - configureUI
    func configureUI() {
        self.view.backgroundColor = .white
        emailLayoutSetting()
        passWordLayoutSetting()
        checkPasswordLayoutSetting()
        
        addSubView()
        cornerRadius()
        location()
        shadow()
        addTarget()
        
        addKeyboardNotifications()
        removeKeyboardNotifications()
        
        emailContainer.textField.delegate = self
        passwordContainer.textField.delegate = self
        checkPasswordContainer.textField.delegate = self
    }
    
//  MARK: - addTarget
    func addTarget(){
        loginButton.addTarget(self, action: #selector(loginButtonClicked(sender:)), for: .touchUpInside)
    }
    
//  MARK: - shadow
    func shadow() {
        backgroundView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        backgroundView.layer.shadowOpacity = 1
        backgroundView.layer.shadowRadius = 10
        backgroundView.layer.shadowOffset = CGSize(width: 0, height: 4)
        backgroundView.clipsToBounds = false
    }
    
//  MARK: - cornerRadius
    func cornerRadius() {
        backgroundView.layer.cornerRadius = 50
        backgroundView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        backgroundView.layer.masksToBounds = true
        signUpButton.layer.cornerRadius = 8
    }
    
//  MARK: - addSubView
    func addSubView() {
        self.view.addSubview(signUpLabel)
        self.view.addSubview(backgroundView)
        self.view.addSubview(emailContainer)
        self.view.addSubview(passwordContainer)
        self.view.addSubview(passwordVisibilityButton)
        self.view.addSubview(checkPasswordContainer)
        self.view.addSubview(passwordExampleLabel)
        self.view.addSubview(signUpButton)
        self.view.addSubview(loginButton)
    }

//  MARK: - location
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
        
        emailContainer.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.5)
            make.height.equalToSuperview().dividedBy(16.24)
            make.top.equalTo(backgroundView).offset(self.view.frame.height/10.15)
            make.centerX.equalToSuperview()
        }
        
        passwordContainer.snp.makeConstraints { make in
            make.width.height.equalTo(emailContainer)
            make.top.equalTo(backgroundView).offset(self.view.frame.height/5.31)
            make.centerX.equalToSuperview()
        }
        
        passwordVisibilityButton.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(25)
            make.height.equalToSuperview().dividedBy(90.22)
            make.top.equalTo(backgroundView).offset(self.view.frame.height/4.38)
            make.left.equalToSuperview().offset(self.view.frame.width/1.26)
        }
        
        passwordExampleLabel.snp.makeConstraints { make in
            make.top.equalTo(backgroundView).offset(self.view.frame.height/3.89)
            make.left.equalTo(passwordContainer)
        }
        
        checkPasswordContainer.snp.makeConstraints { make in
            make.width.height.equalTo(emailContainer)
            make.top.equalTo(passwordContainer.snp.bottom).offset(self.view.frame.height/24.61)
            make.left.equalTo(emailContainer)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.5)
            make.height.equalToSuperview().dividedBy(21.37)
            make.top.equalTo(checkPasswordContainer.snp.bottom).offset(self.view.frame.height/15.32)
            make.centerX.equalToSuperview()
        }
        
        loginButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(self.view.frame.height/13.31)
            make.centerX.equalToSuperview()
        }
    }
    
 //MARK: - Layout Setting
    func emailLayoutSetting(){
        emailContainer.addSubview(emailContainer.label)
        emailContainer.addSubview(emailContainer.textField)
        emailContainer.addSubview(emailContainer.line)
        emailContainer.emailTextFieldSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
    }
    
    func passWordLayoutSetting() {
        passwordContainer.addSubview(passwordContainer.label)
        passwordContainer.addSubview(passwordContainer.textField)
        passwordContainer.addSubview(passwordContainer.line)
        passwordContainer.emailTextFieldSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
    }
    
    func checkPasswordLayoutSetting() {
        checkPasswordContainer.addSubview(checkPasswordContainer.label)
        checkPasswordContainer.addSubview(checkPasswordContainer.textField)
        checkPasswordContainer.addSubview(checkPasswordContainer.line)
        checkPasswordContainer.emailTextFieldSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
    }
    
//MARK: - Setting Keyboard
    
    func addKeyboardNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    func removeKeyboardNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
   }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
         self.view.endEditing(true)

   }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if self.view.frame.origin.y == 0 {
            self.view.frame.origin.y -= self.view.frame.height/10
        }
    }
      
    @objc func keyboardWillHide(_ notification: Notification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }

//MARK: -Update Sign up
    
    @objc func updateSignUp() {
        let emailPattern = "^[a-zA-Z0-9]+@gsm.hs.kr$"
        let passwordPattern = "^[A-Za-z0-9!_@$%^&+=]{8,16}$"
        let emailRegex = try? NSRegularExpression(pattern: emailPattern)
        let passwordRegex = try? NSRegularExpression(pattern: passwordPattern)
        
        if let _ = emailRegex?.firstMatch(in: emailContainer.textField.text!, options: [], range: NSRange(location: 0, length: emailContainer.textField.text!.count)),
           let _ = passwordRegex?.firstMatch(in: passwordContainer.textField.text!, options: [], range: NSRange(location: 0, length: passwordContainer.textField.text!.count)),
           checkPasswordContainer.textField.text == passwordContainer.textField.text{
            print("성공")
            signUpButton.backgroundColor = .rgba(red: 255, green: 172, blue: 183, alpha: 1)
//            signUpButton.isEnabled = true
        }else{
            print("실패")
//            signUpButton.backgroundColor = .rgba(red: 255, green: 172, blue: 183, alpha: 0.7)
//            signUpButton.isEnabled = false
        }
    }
    
//MARK: - Actions
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = passwordContainer.textField.text else { return true }
        let newLength = text.count + string.count - range.length
          return newLength <= 16

    }
    
    
    @objc
    func changePasswordVisibilityToggle(_ sender : UIButton) {
        if passwordContainer.textField.isSecureTextEntry{
            sender.setImage(UIImage(systemName: "eye"), for: .normal)
        }else{
            sender.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        }
        passwordContainer.textField.isSecureTextEntry.toggle()
        checkPasswordContainer.textField.isSecureTextEntry.toggle()
    }
    
    @objc
    func clickSignUpButton(_ sender: UIButton) {
        updateSignUp()
        let model: studentModel = studentModel(name: "",
                                               email: emailContainer.textField.text!,
                                               password: passwordContainer.textField.text!,
                                               grade: 0, class: 0, s_number: 0)
        let controller = InformationViewController()
        controller.model = model
        self.navigationController?.pushViewController(controller, animated: true)
        print("Click Sign up Button")
    }
    
}

//MARK: - Preview
//
//#if DEBUG
//import SwiftUI
//struct SignUpViewControllerRepresentable: UIViewControllerRepresentable {
//
//func updateUIViewController(_ uiView: UIViewController,context: Context) {
//        // leave this empty
//}
//    @available(iOS 13.0.0, *)
//    func makeUIViewController(context: Context) -> UIViewController{
//        SignUpViewController()
//    }
//}
//@available(iOS 13.0, *)
//struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
//    static var previews: some View {
//        Group {
//            SignUpViewControllerRepresentable()
//                .ignoresSafeArea()
//                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
//                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
//        }
//
//    }
//} #endif
