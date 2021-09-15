//
//  MyPageViewController.swift
//  GOOUT
//
//  Created by 김유진 on 2021/09/15.
//

import UIKit

class MyPageViewController: UIViewController {
    
    //MARK: - Properties
    lazy var myPageTitleLabel = UILabel().then {
        $0.text = "My Page"
        $0.dynamicFont(fontSize: 25, currentFontName: "FugazOne-Regular")
        $0.textColor = .rgb(red: 255, green: 168, blue: 179)
    }
    
    lazy var logOutButton = UIButton().then{
        $0.layer.cornerRadius = 20
        $0.backgroundColor = .white
        $0.layer.shadowColor = UIColor.lightGray.cgColor
        $0.layer.shadowOffset = CGSize(width: 0, height: 4)
        $0.layer.shadowRadius = 10
        $0.layer.shadowOpacity = 0.3
    }
    
    lazy var logOutViewConponentView = UIView().then{
        $0.backgroundColor = .white
    }
    
    lazy var logOutImageButton = UIButton().then{
        $0.setImage(UIImage(named: "GOOUT_LogOutImage"), for: .normal)
    }
    
    lazy var logOutLabel = UILabel().then{
        $0.text = "로그아웃하기"
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = UIColor.rgb(red: 80, green: 80, blue: 80)
    }

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutSetting()
    }
    
    @objc func logOutButtonClicked(sender:UIButton){
        print("awklejf;")
    }
    
    //MARK: - layoutSetting
    func layoutSetting(){
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(myPageTitleLabel)
        self.view.addSubview(logOutButton)
        logOutButton.addSubview(logOutViewConponentView)
        logOutViewConponentView.addSubview(logOutImageButton)
        logOutViewConponentView.addSubview(logOutLabel)
                
        logOutButton.addTarget(self, action: #selector(logOutButtonClicked(sender:)), for: .touchUpInside)
        logOutImageButton.addTarget(self, action: #selector(logOutButtonClicked(sender:)), for: .touchUpInside)
        
        myPageTitleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/11.5)
            make.top.equalToSuperview().offset(self.view.frame.height/11.44)
        }
        
        logOutButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalTo(myPageTitleLabel)
            make.height.equalToSuperview().dividedBy(4.31)
            make.top.equalTo(myPageTitleLabel.snp.bottom).offset(self.view.frame.height/23.88)
        }
        
        logOutViewConponentView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.4)
            make.height.equalToSuperview().dividedBy(1.5)
        }
        
        logOutImageButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.4)
            make.height.equalToSuperview().dividedBy(1.4)
        }
        
        logOutLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
    }

}
