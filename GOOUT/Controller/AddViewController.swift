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
    
    lazy var whiteView = UIView().then{
        $0.backgroundColor = UIColor.white
        $0.layer.shadowColor = UIColor.lightGray.cgColor
        $0.layer.shadowOffset = CGSize(width: 0, height: 3)
        $0.layer.shadowRadius = 10
        $0.layer.shadowOpacity = 0.3
        $0.layer.cornerRadius = 15
    }
    
    lazy var gooutButton = UIButton().then{
        $0.setImage(UIImage(named: "GOOUT_SelectedCheckButtonImage"), for: .normal)
    }
    
    lazy var earlyLeaveButton = UIButton().then{
        $0.setImage(UIImage(named: "GOOUT_CheckButtonImage"), for: .normal)
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
        self.view.addSubview(whiteView)
        
        titleView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(10.38)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(self.view.frame.height/200)
            make.centerX.equalToSuperview()
        }
        
        whiteView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(self.view.frame.width/6.16)
            make.height.equalToSuperview().dividedBy(15.14)
            make.top.equalTo(titleView.snp.bottom).offset(self.view.frame.height/12.75)
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
