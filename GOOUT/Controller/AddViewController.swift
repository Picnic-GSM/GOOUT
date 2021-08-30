//
//  AddViewController.swift
//  GOOUT
//
//  Created by 김유진 on 2021/08/30.
//

import UIKit
import Then
import SnapKit
 
class AddViewController: UIViewController{
    // MARK: - property
    lazy var titleView = UIView().then{
        $0.backgroundColor = UIColor(red: 104/255, green: 134/255, blue: 197/255, alpha: 1)
    }
    
    lazy var titleLabel = UILabel().then{
        $0.text = "외출/조퇴 추가하기"
        $0.textColor = UIColor.white
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    // MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutSetting()
    }
    
    // MARK: - layoutSetting
    func layoutSetting(){
        self.view.backgroundColor = .white
        self.view.addSubview(titleView)
        titleView.addSubview(titleLabel)
        
        titleView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(10.38)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(self.view.frame.height/200)
            make.centerX.equalToSuperview()
        }
        
        // MARK: - lineView gradient
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height/10.38))
        let gradient = CAGradientLayer()

        gradient.frame = view.bounds
        gradient.colors = [UIColor(red: 255/255, green: 173/255, blue: 172/255, alpha: 1).cgColor, UIColor(red: 104/255, green: 134/255, blue: 197/255, alpha: 1).cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)

        titleView.layer.insertSublayer(gradient, at: 0)
        
    }
}
