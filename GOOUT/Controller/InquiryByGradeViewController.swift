//
//  ViewController.swift
//  GOOUT
//
//  Created by 김유진 on 2021/08/27.
//

import UIKit
import Then
import SnapKit

class InquiryByGradeViewController : UIViewController {
    
    // MARK: - property
    lazy var mainTabBarView = MainTabBarView()
    
    lazy var viewControllerView = UIView().then{
        $0.backgroundColor = .systemPink
    }
    
    // MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutSetting()

        mainTabBarViewSetting()
    }
    
    @objc func myClassInquiryButtonClicked(sender:UIButton){

        viewControllerView.isHidden = false
    }
    
    @objc func allClassInquiryButtonClicked(sender:UIButton){
        viewControllerView.isHidden = true
    }
    
    
    
    // MARK: - layoutSetting
    func layoutSetting(){
        self.view.backgroundColor = .yellow
        
        self.view.addSubview(mainTabBarView)
        self.view.addSubview(viewControllerView)
        
        viewControllerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalToSuperview().offset(-self.view.frame.height/10.15)
        }


        let vc = MyClassInquiryViewController()
        self.addChild(vc)
        vc.view.frame = viewControllerView.frame
        
        viewControllerView.addSubview(vc.view)
        
        viewControllerView.isHidden = true
    }
    
    // MARK: - mainTabBarViewSetting
    func mainTabBarViewSetting(){
        mainTabBarView.allClassInquiryButton.setImage(UIImage(named: "GOOUT_SelectedAllClassInquiryButtonImage"), for: .normal)
        
        mainTabBarView.myClassInquiryButton.addTarget(self, action: #selector(myClassInquiryButtonClicked(sender:)), for: .touchUpInside)
        mainTabBarView.allClassInquiryButton.addTarget(self, action: #selector(allClassInquiryButtonClicked(sender:)), for: .touchUpInside)
        
        mainTabBarView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(10.15)
        }
        
        mainTabBarView.lineView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(2)
            make.centerX.equalToSuperview()
        }
        
        mainTabBarView.addButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(14.37)
            make.height.equalTo(mainTabBarView.addButton.snp.width)
            make.top.equalTo(mainTabBarView.lineView.snp.bottom).offset(self.view.frame.height/58)
        }
        
        mainTabBarView.allClassInquiryButton.snp.makeConstraints { make in
            make.centerY.equalTo(mainTabBarView.addButton)
            make.height.width.equalTo(mainTabBarView.addButton)
            make.left.equalToSuperview().offset(self.view.frame.width/8.1)
        }
        
        mainTabBarView.myClassInquiryButton.snp.makeConstraints { make in
            make.centerY.equalTo(mainTabBarView.addButton)
            make.height.width.equalTo(mainTabBarView.addButton)
            make.right.equalToSuperview().offset(-self.view.frame.width/8.1)
        }
        
        // MARK: - lineView gradient
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 2))
        let gradient = CAGradientLayer()

        gradient.frame = view.bounds
        gradient.colors = [UIColor(red: 104/255, green: 134/255, blue: 197/255, alpha: 1).cgColor, UIColor(red: 255/255, green: 173/255, blue: 172/255, alpha: 1).cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)

        mainTabBarView.lineView.layer.insertSublayer(gradient, at: 0)
        
    }
    
}

