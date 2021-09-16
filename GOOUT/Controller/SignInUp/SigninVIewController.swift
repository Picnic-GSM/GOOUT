//
//  SigninVIewController.swift
//  GOOUT
//
//  Created by baegteun on 2021/08/30.
//

import UIKit
import Then
import SnapKit
import Firebase
import Alamofire

class SigninViewController: UIViewController{
    // MARK: - Properties
    private var email: String = ""
    private var password: String = ""
    lazy var formBound = formView.bounds
    private let mainBound = UIScreen.main.bounds
    
    let SigninText = UILabel().then {
        $0.text = "Sign in"
        $0.dynamicFont(fontSize: 30, currentFontName: "FugazOne-Regular")
        $0.textColor = UIColor(red: 0.408, green: 0.525, blue: 0.773, alpha: 1)
    }
    
    lazy var formView = UIView(frame: CGRect(x: 0, y: 0, width: mainBound.width, height: mainBound.height*0.75))
    
    let emailTextField = UITextField().then{
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.placeholder = "이메일을 입력하세요."
        $0.keyboardType = .emailAddress
    }
    lazy var emailView = loginTextFieldView(textField: emailTextField, text: "Email", labelfontsize: 14)
    
    let passwordTextField = UITextField().then {
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.placeholder = "비밀번호를 입력하세요."
        $0.isSecureTextEntry = true
    }
    lazy var passwordView = loginTextFieldView(textField: passwordTextField, text: "Password", labelfontsize: 14)
    
    lazy var stack = UIStackView(arrangedSubviews: [emailView, passwordView]).then{
        $0.axis = .vertical
        $0.spacing = self.formBound.height*0.035
    }
    
    lazy var passwordVisibilityBtn = UIButton(frame: CGRect(x: 0, y: 0, width: self.formBound.width*0.02, height: self.formBound.height*0.014)).then {
        $0.setImage(UIImage(systemName: "eye"), for: .normal)
        $0.tintColor = UIColor(red: 0.424, green: 0.424, blue: 0.424, alpha: 1)
        $0.addTarget(self, action: #selector(changePasswordVisibilityToggle(_:)), for: .touchUpInside)
    }
    
    let findPasswordButton = UIButton().then {
        $0.setTitle("비밀번호 찾기", for: .normal)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.setTitleColor(UIColor.rgb(red: 118, green: 118, blue: 118), for: .normal)
    }
    
    lazy var loginBtn = UIButton(frame: CGRect(x: 0, y: 0, width: self.formBound.width*0.66, height: self.formBound.height*0.06)).then {
        $0.setTitle("Sign in", for: .normal)
        $0.isEnabled = false
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.layer.cornerRadius = 8
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = UIColor(red: 0.408, green: 0.525, blue: 0.773, alpha: 0.7)
    }
    
    let loginFailedMessage = UILabel().then {
        $0.text = "데이터가 일치하지 않습니다!"
        $0.dynamicFont(fontSize: 10, currentFontName: "Apple SD Gothic Neo")
        $0.isHidden = true
        $0.textColor = .red
    }
    
    let makeAccountBtn = UIButton().then {
        $0.setTitle("아직 계정이 없으신가요?", for: .normal)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.setTitleColor(UIColor(red: 0.463, green: 0.463, blue: 0.463, alpha: 1), for: .normal)
    }
    
    let teacherButton = UIButton().then {
        $0.setTitle("선생님이신가요?", for: .normal)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.setTitleColor(.rgb(red: 118, green: 118, blue: 118), for: .normal)
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        addView()
        configureUI()
        configureShadow()
        addTextFieldObservers()
        
        
        loginBtn.addTarget(self, action: #selector(loginBtnClicked(sender:)), for: .touchUpInside)
        makeAccountBtn.addTarget(self, action: #selector(makeAccountBtnClicked(sender:)), for: .touchUpInside)
        findPasswordButton.addTarget(self, action: #selector(findPasswordButtonClicked(sender:)), for: .touchUpInside)
        teacherButton.addTarget(self, action: #selector(teacherBtnClicked(sender:)), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addKeyObserver()
    }
    
    
    
    @objc func keyboardWillShow(_ notification: Notification) {
      if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
        let keybaordRectangle = keyboardFrame.cgRectValue
        let keyboardHeight = keybaordRectangle.height
        UIView.animate(withDuration: 0.3, animations: {
            self.view.transform = CGAffineTransform(translationX: 0, y: -keyboardHeight/4)
            
        })

        
      }
    }
      
    @objc func keyboardWillHide(_ notification: Notification) {
      if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
        let keybaordRectangle = keyboardFrame.cgRectValue
        let keyboardHeight = keybaordRectangle.height
        UIView.animate(withDuration: 0.3, animations: {
            self.view.transform = .identity
            
        })
      }
    }
    
    func apiCall(email: String, password: String, completion: @escaping (Bool, String) -> Void) {
        let URL = "\(Config.baseURL)/login"
        let param: Parameters = [
            "email":email,
            "password":password
        ]
        AF.request(URL, method: .post, parameters: param).responseJSON { response in
            switch response.result {
            case .success(let value):
                print(value)
                switch response.response?.statusCode {
                case 201:
                    if let dic = value as? NSDictionary,
                       let accessToken = dic["accessToken"] as? String {
                        print(accessToken)
                        completion(true, accessToken)
                    }
                default:
                    print("입력된 데이터가 일치하지 않다")
                    completion(false,"")
                }
            case .failure(let error):
                print(error.localizedDescription)
                completion(false,"")
            }
        }
    }
    
    @objc func loginBtnClicked(sender:UIButton){
        apiCall(email: email, password: password) { response, token  in
            switch response {
            case true:
                print("화면 전환")
                NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
                NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
                let nextVC = MainViewController()
                
                nextVC.modalPresentationStyle = .fullScreen
                self.present(nextVC, animated: true, completion: nil)
                break
            case false:
                self.invalidMessage()
                print("통신 오류")
            }
        }
   
        
        
    }
    func invalidMessage(){
        self.loginFailedMessage.isHidden = false
        let dispatchTime = DispatchTime.now()+2
        DispatchQueue.main.asyncAfter(deadline: dispatchTime, execute: {self.loginFailedMessage.isHidden = true})
    }
    
    @objc func findPasswordButtonClicked(sender:UIButton){
        let nextVC = ForgotPasswordViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func makeAccountBtnClicked(sender:UIButton){
        let nextVC = SignUpViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func teacherBtnClicked(sender: UIButton){
        let nextVC = EnterDistributioncode()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
         self.view.endEditing(true)
   }
    
    // MARK: - Helpers
    
    // MARK: addView
    func addView(){
        view.addSubview(SigninText)
        view.addSubview(formView)
        view.addSubview(stack)
        view.addSubview(passwordVisibilityBtn)
        view.addSubview(findPasswordButton)
        view.addSubview(loginBtn)
        view.addSubview(loginFailedMessage)
        view.addSubview(teacherButton)
        view.addSubview(makeAccountBtn)
    }
    
    // MARK: configureUI
    func configureUI(){
        SigninText.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(mainBound.height*0.125)
            $0.left.equalTo(view.snp.left).offset(mainBound.width*0.117)
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
            $0.right.equalTo(passwordTextField.snp.right)
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
        
        teacherButton.snp.makeConstraints {
            $0.top.equalTo(loginFailedMessage.snp.bottom).offset(self.formBound.height*0.016)
            $0.centerX.equalTo(formView)
        }
        
        makeAccountBtn.snp.makeConstraints {
            $0.bottom.equalTo(formView.snp.bottom).inset(self.formBound.height*0.102)
            $0.centerX.equalTo(formView)
        }
        
        
        
        
    }
    
    // MARK: configureShadow
    func configureShadow(){
        formView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        formView.layer.shadowOpacity = 1
        formView.layer.shadowRadius = 10
        formView.layer.shadowOffset = CGSize(width: 0, height: 4)
        formView.layer.bounds = formView.bounds
        formView.layer.position = formView.center
        formView.layer.cornerRadius = 50
        
        formView.backgroundColor = .rgb(red: 243, green: 247, blue: 255)
        formView.clipsToBounds = false
    }
    
    // MARK: loginTextFieldViewMaker
    func loginTextFieldView(textField: UITextField, text: String, labelfontsize: CGFloat) -> UIView{
        let view = UIView()
        let label = UILabel()
        label.text = text
        label.textColor = UIColor(red: 0.408, green: 0.525, blue: 0.733, alpha: 1)
        label.dynamicFont(fontSize: labelfontsize, currentFontName: "AppleSDGothicNeo-SemiBold")
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left)
        }
        
        view.addSubview(textField)
        textField.setPlaceholderColor(UIColor(red: 0.425, green: 0.425, blue: 0.425, alpha: 1))
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
    func addKeyObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    // MARK: updateLoginBtn
    func updateLoginbtn(){
        let emailPattern = "^[a-zA-Z0-9]+@gsm.hs.kr$"
        let passwordPattern = "^(?=.*[!@#$%^&*()_+=-]).{8,16}$"
        let emailRegex = try? NSRegularExpression(pattern: emailPattern)
        let passwordRegex = try? NSRegularExpression(pattern: passwordPattern)
        if let _ = emailRegex?.firstMatch(in: email, options: [], range: _NSRange(location: 0, length: email.count)),
           let _ = passwordRegex?.firstMatch(in: password, options: [], range: _NSRange(location: 0, length: password.count)){
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
}

// MARK: - Extension

// MARK: UITextFieldDelegate
extension SigninViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField{
            self.passwordTextField.becomeFirstResponder()
        }else{
            loginBtnClicked(sender: loginBtn)
        }
        return true
    }
}
