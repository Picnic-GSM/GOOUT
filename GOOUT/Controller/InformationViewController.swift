//
//  InformationViewController.swift
//  GOOUT
//
//  Created by GSM02 on 2021/09/08.
//

import UIKit
import SnapKit
import Then

class InformationViewController: UIViewController {
    
    lazy var informationLabel = UILabel().then {
        $0.text = "Information"
        $0.dynamicFont(fontSize: 30, currentFontName: "FugazOne-Regular")
        $0.textColor = .rgb(red: 255, green: 172, blue: 183)
    }
    
    lazy var backgroundView = UIView().then {
        $0.backgroundColor = .rgb(red: 255, green: 243, blue: 243)
    }
    
    lazy var gradeLabel = UILabel().then {
        $0.text = "Grade"
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = .rgb(red: 255, green: 172, blue: 183)
    }
    
    lazy var gradeView = UIView().then {
        $0.backgroundColor = .rgb(red: 255, green: 255, blue: 255)
    }
    
    lazy var grade1Button = UIButton().then {
        $0.setTitle("1학년", for: .normal)
        $0.setTitleColor(.rgb(red: 108, green: 108, blue: 108), for: .normal)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.addTarget(self, action: #selector(tabGrade1Button), for: .touchUpInside)
    }
    
    lazy var classLabel = UILabel().then {
        $0.text = "Class"
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = .rgb(red: 255, green: 172, blue: 183)
    }
    
    lazy var numberLabel = UILabel().then {
        $0.text = "Number"
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = .rgb(red: 255, green: 172, blue: 183)
    }
    
    lazy var signUpButton = UIButton().then {
        $0.setTitle("Sign up", for: .normal)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.backgroundColor = .rgb(red: 255, green: 172, blue: 183)
    }
    
    lazy var loginButton = UIButton().then {
        $0.setTitleColor(.rgb(red: 118, green: 118, blue: 118), for: .normal)
        $0.setTitle("이미 계정이 있으신가요?", for: .normal)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        self.view.backgroundColor = .white
        addSubView()
        cornerRadius()
        location()
        shadow()
    }
    
    func addSubView() {
        self.view.addSubview(informationLabel)
        self.view.addSubview(backgroundView)
        self.view.addSubview(gradeLabel)
        self.view.addSubview(classLabel)
        self.view.addSubview(numberLabel)
        self.view.addSubview(signUpButton)
        self.view.addSubview(loginButton)
        self.view.addSubview(gradeView)
        self.view.addSubview(grade1Button)
    }
    
    func cornerRadius() {
        backgroundView.layer.cornerRadius = 50
        backgroundView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        backgroundView.layer.masksToBounds = true
        
        signUpButton.layer.cornerRadius = 8
        
        gradeView.layer.cornerRadius = 8
    }
    
    func shadow() {
        backgroundView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        backgroundView.layer.shadowOpacity = 1
        backgroundView.layer.shadowRadius = 10
        backgroundView.layer.shadowOffset = CGSize(width: 0, height: 4)
        backgroundView.clipsToBounds = false
    }
    
    func location() {
        informationLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/7.96)
            make.left.equalToSuperview().offset(self.view.frame.width/8.52)
        }
        
        backgroundView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(1.33)
            make.top.equalToSuperview().offset(self.view.frame.height/4)
        }
        
        gradeLabel.snp.makeConstraints { make in
            make.top.equalTo(backgroundView).offset(self.view.frame.height/10.83)
            make.left.equalToSuperview().offset(self.view.frame.width/6.05)
        }
        
        gradeView.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.5)
            make.height.equalToSuperview().dividedBy(21.37)
            make.top.equalTo(gradeLabel.snp.bottom).offset(self.view.frame.height/135.33)
            make.left.equalTo(gradeLabel)
        }
        
        grade1Button.snp.makeConstraints { make in
            make.centerY.equalTo(gradeView)
            make.left.equalTo(gradeView).offset(self.view.frame.width/11.03)
        }
        
        classLabel.snp.makeConstraints { make in
            make.top.equalTo(backgroundView).offset(self.view.frame.height/5.08)
            make.left.equalTo(gradeLabel)
        }
        
        numberLabel.snp.makeConstraints { make in
            make.top.equalTo(backgroundView).offset(self.view.frame.height/3.31)
            make.left.equalTo(gradeLabel)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.5)
            make.height.equalToSuperview().dividedBy(21.37)
            make.top.equalTo(numberLabel.snp.bottom).offset(self.view.frame.height/10.41)
            make.centerX.equalToSuperview()
        }
        
        loginButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(self.view.frame.height/13.31)
            make.centerX.equalToSuperview()
        }
    }
    
//MARK: - Action
    @objc
    func tabGrade1Button() {
        
    }
}

//MARK: - Preview

#if DEBUG
import SwiftUI
struct InformationViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        InformationViewController()
    }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            InformationViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif
