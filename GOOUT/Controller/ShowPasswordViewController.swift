//
//  ShowPassword.swift
//  GOOUT
//
//  Created by GSM06 on 2021/09/02.
//

import UIKit
import SnapKit
import Then

extension UILabel{
    public func updateGradientTextColor_horizontal(gradientColors: [UIColor] = [UIColor(white: 0, alpha: 0.95), UIColor(white: 0, alpha: 0.6)]){
        let size = CGSize(width: intrinsicContentSize.width, height: 1)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        
        defer { UIGraphicsEndImageContext()}
        guard let context = UIGraphicsGetCurrentContext() else {return}
        var colors: [CGColor] = []
        for color in gradientColors{
            colors.append(color.cgColor)
        }
        guard let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(),
                                        colors: colors as CFArray,
                                        locations: nil) else {return }
        
        context.drawLinearGradient(
            gradient,
            start: CGPoint.zero,
            end: CGPoint(x: size.width, y:0),
            options: []
        )
        if let image = UIGraphicsGetImageFromCurrentImageContext(){
            self.textColor = UIColor(patternImage: image)
        }
    }
    
    public func updateGradientTextColor_vertical(gradientColors: [UIColor] = [UIColor(white: 0, alpha: 0.95), UIColor(white: 0, alpha: 0.6)]){
        let size = CGSize(width: intrinsicContentSize.width, height: intrinsicContentSize.height)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)

        defer { UIGraphicsEndImageContext()}
        guard let context = UIGraphicsGetCurrentContext() else {return}
        var colors: [CGColor] = []
        for color in gradientColors{
            colors.append(color.cgColor)
        }
        guard let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(),
                                        colors: colors as CFArray,
                                        locations: nil) else {return }
        
        context.drawLinearGradient(
            gradient,
            start: CGPoint.zero,
            end: CGPoint(x: 0, y: size.height),
            options: []
        )
        if let image = UIGraphicsGetImageFromCurrentImageContext(){
            self.textColor = UIColor(patternImage: image)
        }
    }
}

class ShowPasswordViewController: UIViewController{
    let mainView = UIView()
    let bound = UIScreen.main.bounds
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationController?.isNavigationBarHidden = true
        view.addSubview(mainView)
        
        let gradientLayer = CAGradientLayer()
            gradientLayer.frame = view.bounds
            gradientLayer.colors = [
            UIColor(red: 0.408, green: 0.525, blue: 0.773, alpha: 1.1).cgColor,
            UIColor(red: 1, green: 0.675, blue: 0.718, alpha: 1).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.25, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.75, y: 1)
        gradientLayer.cornerRadius = 55
        gradientLayer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)
        view.backgroundColor = .white
        
    mainView.layer.addSublayer(gradientLayer)
        mainView.snp.makeConstraints{ make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(bound.height*0.74)
            make.top.equalTo(bound.height*0.25)
        }
        let showPassword = UILabel()
        showPassword.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)
        view.addSubview(showPassword)
        
        showPassword.font = UIFont(name: "AppleSDGothicNeo-Thin", size: 14)
        showPassword.numberOfLines = 0
        showPassword.lineBreakMode = .byWordWrapping
        showPassword.textAlignment = .center
        showPassword.text = "회원가입 시 사용하신 비밀번호는\n‘ 123**** ’ 입니다."
        showPassword.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        showPassword.layer.cornerRadius = 15
        showPassword.layer.masksToBounds = true
        
        showPassword.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(bound.height*0.34)
            make.height.equalTo(bound.height*0.11)
            make.width.equalTo(bound.width*0.623)
        }
        let toLogInBtn = UIButton()
        
        view.addSubview(toLogInBtn)
        
        toLogInBtn.backgroundColor = .white
        toLogInBtn.layer.cornerRadius = 10
        toLogInBtn.setTitle("로그인 화면으로", for: .normal)
        toLogInBtn.setTitleColor(UIColor(red: 0.485, green: 0.485, blue: 0.485, alpha: 1), for: .normal)
        toLogInBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 12)
        toLogInBtn.layer.cornerRadius = 10
        toLogInBtn.layer.masksToBounds = true
        toLogInBtn.addTarget(self, action: #selector(toLogInBtnClicked(sender:)), for: .touchUpInside)
        
        toLogInBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            //make.top.equalTo(showPassword.snp.bottom).offset(34)
            make.top.equalTo(bound.height*0.49)
            make.height.equalTo(bound.height*0.037)
            make.width.equalTo(bound.width*0.31)
        }
        
        let findPassword = UILabel()
        findPassword.dynamicFont(fontSize: 25, currentFontName: "FugazOne-Regular")
        findPassword.text = "Find Password"
        view.addSubview(findPassword)
        findPassword.snp.makeConstraints { make in
            //make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(58)
            //make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(44)
            make.top.equalTo(bound.height*0.13)
            make.left.equalTo(bound.width*0.12)
            make.width.equalTo(bound.width*0.8)
            make.height.equalTo(bound.height*0.08)
        }
    }
    
    @objc func toLogInBtnClicked(sender:UIButton){
        let nextVC = SigninViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

