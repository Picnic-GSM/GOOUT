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
    
    lazy var logOutView = UIView().then{
        $0.layer.cornerRadius = 20
        $0.backgroundColor = .white
        $0.layer.shadowColor = UIColor.lightGray.cgColor
        $0.layer.shadowOffset = CGSize(width: 0, height: 4)
        $0.layer.shadowRadius = 10
        $0.layer.shadowOpacity = 0.3
    }
    
    lazy var logOutViewConponentView = UIView().then{
        $0.backgroundColor = .blue
    }

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutSetting()
    }
    
    //MARK: - layoutSetting
    func layoutSetting(){
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(myPageTitleLabel)
        self.view.addSubview(logOutView)
        logOutView.addSubview(logOutViewConponentView)
        
        myPageTitleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/11.5)
            make.top.equalToSuperview().offset(self.view.frame.height/11.44)
        }
        
        logOutView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalTo(myPageTitleLabel)
            make.height.equalToSuperview().dividedBy(4.31)
            make.top.equalTo(myPageTitleLabel.snp.bottom).offset(self.view.frame.height/23.88)
        }
        
        logOutViewConponentView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.4)
            make.height.equalToSuperview().dividedBy(1.4)
        }
        
    }

}
