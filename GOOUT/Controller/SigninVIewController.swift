//
//  SigninVIewController.swift
//  GOOUT
//
//  Created by baegteun on 2021/08/30.
//

import UIKit
import Then
import SnapKit

class SigninViewController: UIViewController{
    // MARK: - Properties
    private var email: String = ""
    private var password: String = ""
    lazy var formBound = formView.bounds
    private let mainBound = UIScreen.main.bounds
    
    lazy var signinImage = UIImageView(image: UIImage(named: "GOOUT_SigninLogo"))
    
    lazy var formView = UIView(frame: CGRect(x: 0, y: 0, width: mainBound.width, height: mainBound.height*0.75))
    
    
    
    let emailTextField = UITextField().then{
        $0.placeholder = "이메일을 입력하세요."
        $0.keyboardType = .emailAddress
    }
    lazy var emailView = loginTextFieldView(textField: emailTextField, text: "Email", fontsize: 14)
    
    let passwordTextField = UITextField().then {
        $0.placeholder = "비밀번호를 입력하세요."
        $0.isSecureTextEntry = true
    }
    lazy var passwordView = loginTextFieldView(textField: passwordTextField, text: "Password", fontsize: 14)
    
    lazy var stack = UIStackView(arrangedSubviews: [emailView, passwordView]).then{
        $0.axis = .vertical
        $0.spacing = self.formBound.height*0.035
    }
    
    lazy var passwordVisibilityBtn = UIButton(frame: CGRect(x: 0, y: 0, width: self.formBound.width*0.02, height: self.formBound.height*0.014)).then {
        $0.setImage(UIImage(systemName: "eye"), for: .normal)
        $0.tintColor = UIColor(red: 0.424, green: 0.424, blue: 0.424, alpha: 1)
        $0.addTarget(self, action: #selector(changePasswordVisibilityToggle(_:)), for: .touchUpInside)
    }
    
    lazy var findPasswordButton = UIButton().then {
        $0.setTitle("비밀번호 찾기", for: .normal)
        $0.dynamicFont(fontSize: 8, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.setTitleColor(UIColor(red: 0.463, green: 0.463, blue: 0.463, alpha: 1), for: .normal)
        $0.addTarget(self, action: #selector(showFindPasswordController), for: .touchUpInside)
    }
    
    lazy var loginBtn = UIButton(frame: CGRect(x: 0, y: 0, width: self.formBound.width*0.66, height: self.formBound.height*0.06)).then {
        $0.setTitle("Sign in", for: .normal)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.layer.cornerRadius = 8
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = UIColor(red: 0.408, green: 0.525, blue: 0.773, alpha: 0.7)
        $0.isEnabled = false
        $0.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
    }
    
    lazy var loginFailedMessage = UILabel().then {
        $0.text = "회원정보가 일치하지 않습니다!"
        $0.dynamicFont(fontSize: 10, currentFontName: "Apple SD Gothic Neo")
        $0.isHidden = true
        $0.textColor = .red
    }
    
    let makeAccountBtn = UIButton().then {
        $0.setTitle("아직 계정이 없으신가요?", for: .normal)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.setTitleColor(UIColor(red: 0.463, green: 0.463, blue: 0.463, alpha: 1), for: .normal)
        $0.addTarget(self, action: #selector(showRegsiterController), for: .touchUpInside)
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        emailTextField.becomeFirstResponder()
        addView()
        configureUI()
        configureShadow()
        addTextFieldObservers()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
         self.view.endEditing(true)
   }
    
    // MARK: - Helpers
    // MARK: addView
    func addView(){
        view.addSubview(signinImage)
        view.addSubview(formView)
        view.addSubview(stack)
        view.addSubview(passwordVisibilityBtn)
        view.addSubview(findPasswordButton)
        view.addSubview(loginBtn)
        view.addSubview(loginFailedMessage)
        view.addSubview(makeAccountBtn)
    }
    
    // MARK: configureUI
    func configureUI(){
        
        signinImage.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(mainBound.height/8)
            $0.left.equalTo(view.snp.left).offset(mainBound.width/9)
            $0.height.equalTo(mainBound.height*0.055)
            $0.width.equalTo(mainBound.width*0.264)
        }
        
        formView.snp.makeConstraints {
            $0.left.bottom.right.equalToSuperview()
            $0.width.equalTo(mainBound.width)
            $0.height.equalTo(mainBound.height*0.75)
        }
        
        stack.snp.makeConstraints {
            $0.left.equalTo(formView.snp.left).offset(self.formBound.width*0.168)
            $0.right.equalTo(formView.snp.right).inset(self.formBound.width*0.168)
            $0.top.equalTo(formView.snp.top).offset(self.formBound.height*0.129)
        }
        
        passwordVisibilityBtn.snp.makeConstraints {
            $0.left.equalTo(passwordTextField.snp.right)
            $0.centerY.equalTo(passwordTextField)
        }
        
        findPasswordButton.snp.makeConstraints {
            $0.left.equalTo(passwordView.snp.left)
            $0.top.equalTo(passwordView.snp.bottom).offset(self.formBound.height*0.016)
        }
        
        loginBtn.snp.makeConstraints {
            $0.top.equalTo(findPasswordButton.snp.bottom).offset(self.formBound.height*0.05)
            $0.left.right.equalTo(emailView)
            $0.height.equalTo(self.formBound.height*0.06)
        }
        
        loginFailedMessage.snp.makeConstraints {
            $0.top.equalTo(loginBtn.snp.bottom).offset(self.formBound.height*0.01)
            $0.centerX.equalTo(formView)
        }
        
        makeAccountBtn.snp.makeConstraints {
            $0.bottom.equalTo(formView.snp.bottom).inset(self.formBound.height*0.102)
            $0.centerX.equalTo(formView)
        }
        
        
        
    }
    
    // MARK: configureShadow
    func configureShadow(){
        
        let shadows = UIView().then{
            $0.frame = formView.frame
            $0.clipsToBounds = false
        }
        
        let shadowPath0 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: mainBound.width*0.12)
        
        let layer0 = CALayer().then{
            $0.shadowPath = shadowPath0.cgPath
            $0.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            $0.shadowOpacity = 1
            $0.shadowRadius = 10
            $0.shadowOffset = CGSize(width: 0, height: 4)
            $0.bounds = shadows.bounds
            $0.position = shadows.center
        }
        
        let shapes = UIView().then{
            $0.frame = formView.frame
            $0.clipsToBounds = true
        }
        
        let layer1 = CALayer().then{
            $0.backgroundColor = UIColor(red: 0.954, green: 0.969, blue: 1, alpha: 1).cgColor
            $0.cornerRadius = mainBound.width*0.12
            $0.bounds = shapes.bounds
            $0.position = shapes.center
        }
        
        formView.addSubview(shadows)
        shadows.layer.addSublayer(layer0)
        formView.addSubview(shapes)
        shapes.layer.addSublayer(layer1)
    }
    
    // MARK: loginTextFieldViewMaker
    func loginTextFieldView(textField: UITextField, text: String, fontsize: Int) -> UIView{
        let view = UIView()
        let label = UILabel()
        label.text = text
        label.textColor = UIColor(red: 0.408, green: 0.525, blue: 0.733, alpha: 1)
        label.dynamicFont(fontSize: CGFloat(fontsize), currentFontName: "AppleSDGothicNeo-SemiBold")
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left)
        }
        
        view.addSubview(textField)
        textField.snp.makeConstraints {
            $0.top.equalTo(label.safeAreaLayoutGuide.snp.bottom).offset(9)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(10)
            $0.left.equalTo(view.safeAreaLayoutGuide.snp.left)
            $0.right.equalTo(view.safeAreaLayoutGuide.snp.right)
        }
        let Divider = UIView()
        Divider.backgroundColor = UIColor(red: 0.408, green: 0.525, blue: 0.733, alpha: 1)
        
        view.addSubview(Divider)
        
        Divider.snp.makeConstraints {
            $0.left.equalTo(view.safeAreaLayoutGuide.snp.left)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            $0.right.equalTo(view.safeAreaLayoutGuide.snp.right)
            $0.height.equalTo(1)
        }
        return view
    }
    
    // MARK: addTextFieldObservers
    func addTextFieldObservers(){
        emailTextField.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
    }
    
    
    // MARK: updateLoginBtn
    func updateLoginbtn(){
        if !email.isEmpty && !password.isEmpty{
            loginBtn.backgroundColor = UIColor(red: 0.408, green: 0.525, blue: 0.773, alpha: 1)
            loginBtn.isEnabled = true
        }else{
            loginBtn.backgroundColor = UIColor(red: 0.408, green: 0.525, blue: 0.773, alpha: 0.7)
            loginBtn.isEnabled = false
        }
    }
    
    
    
    
    // MARK: - Actions
    
    // MARK: changePasswordVisibility
    @objc func changePasswordVisibilityToggle(_ sender: UIButton){
        passwordTextField.isSecureTextEntry.toggle()
        if passwordTextField.isSecureTextEntry{
            sender.setImage(UIImage(systemName: "eye"), for: .normal)
        }else{
            sender.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        }
    }
    
    // MARK: textDidChange
    @objc func textDidChange(_ sender: UITextField){
        if sender == emailTextField{
            email = sender.text ?? ""
        }else{
            password = sender.text ?? ""
        }
        updateLoginbtn()
    }
    
    // MARK: showFindPassword
    @objc func showFindPasswordController(){
        print("FINDPASS")
    }
    
    // MARK: showRegisterController
    @objc func showRegsiterController(){
        print("REGISTER")
    }
    
    // MARK: handleLoin
    @objc func handleLogin(){
        print("HANDLELOGIN")
        email = emailTextField.text ?? ""
        password = passwordTextField.text ?? ""
        // authService login...
        
        // if let err = err
        self.loginFailedMessage.isHidden = false
        let dispatchTime = DispatchTime.now()+2
        DispatchQueue.main.asyncAfter(deadline: dispatchTime, execute: {self.loginFailedMessage.isHidden = true})
        
    }
}

// MARK: - Extension

// MARK: UITextFieldDelegate
extension SigninViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField{
            self.passwordTextField.becomeFirstResponder()
        }else{
            handleLogin()
        }
        return true
    }
}