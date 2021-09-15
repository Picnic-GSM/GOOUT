//
//  MainViewController.swift
//  GOOUT
//
//  Created by 김유진 on 2021/09/14.
//

import UIKit

class MainViewController: UIViewController {

    lazy var mainTabBarView = MainTabBarView()
    
    let inquiryByGradeViewController = InquiryByGradeViewController()
    
    let inquiryForEachClassViewController = InquiryForEachClassViewController()
    
    let myPageViewController = MyPageViewController()
    
    let viewControllerBoxView = UIView().then{
        $0.backgroundColor = .systemPink
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        layoutSetting()
    }
    
    func layoutSetting(){
        self.view.backgroundColor = .white
        
        self.view.addSubview(mainTabBarView)
        self.view.addSubview(viewControllerBoxView)
        
        mainTabBarView.addButton.addTarget(self, action: #selector(addButtonClicked(sender:)), for: .touchUpInside)
        mainTabBarView.allClassInquiryButton.addTarget(self, action: #selector(allClassInquiryButtonClicked(sender:)), for: .touchUpInside)
        mainTabBarView.myClassInquiryButton.addTarget(self, action: #selector(myClassInquiryButtonClicked(sender:)), for: .touchUpInside)
        
        viewControllerBoxView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(mainTabBarView.lineView.snp.top)
        }
        
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
            make.height.width.equalTo(mainTabBarView.addButton).dividedBy(1.4)
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
        
        // inquiryByGradeViewController를 기본으로 표시
        self.addChild(inquiryByGradeViewController)
        inquiryByGradeViewController.view.frame = viewControllerBoxView.frame
        viewControllerBoxView.addSubview(inquiryByGradeViewController.view)
        
    }

    //MARK: - addButtonClicked
    @objc func addButtonClicked(sender:UIButton){
        let nextVC = AddViewController()
        present(nextVC, animated: true)
        
        // inquiryForEachClassViewController 표시 = 선생님일 때
//        self.addChild(inquiryForEachClassViewController)
//        inquiryForEachClassViewController.view.frame = viewControllerBoxView.frame
//        viewControllerBoxView.addSubview(inquiryForEachClassViewController.view)
    }
    
    @objc func allClassInquiryButtonClicked(sender:UIButton){
        // inquiryByGradeViewController 표시
        self.addChild(inquiryByGradeViewController)
        
        inquiryByGradeViewController.view.frame = viewControllerBoxView.frame
        
        viewControllerBoxView.addSubview(inquiryByGradeViewController.view)
        
        // inquiryForEachClassViewController 삭제
        inquiryForEachClassViewController.removeFromParent() // parentVC로 부터 관계 삭제
        inquiryForEachClassViewController.view.removeFromSuperview() // parentVC.view.addsubView()와 반대 기능
        
        // tabBarView Button 이미지 변경
        mainTabBarView.myClassInquiryButton.setImage(UIImage(named: "GOOUT_MyClassInquiryButtonImage"), for: .normal)
        mainTabBarView.allClassInquiryButton.setImage(UIImage(named: "GOOUT_SelectedAllClassInquiryButtonImage"), for: .normal)
        mainTabBarView.myClassInquiryButton.setImage(UIImage(named: "GOOUT_MyPageImage"), for: .normal)

    }
    
    @objc func myClassInquiryButtonClicked(sender:UIButton){
        self.addChild(myPageViewController)
        myPageViewController.view.frame = viewControllerBoxView.frame
        viewControllerBoxView.addSubview(myPageViewController.view)
        
        // inquiryByGradeViewController 삭제
        inquiryByGradeViewController.removeFromParent() // parentVC로 부터 관계 삭제
        inquiryByGradeViewController.view.removeFromSuperview() // parentVC.view.addsubView()와 반대 기능
        
        mainTabBarView.myClassInquiryButton.setImage(UIImage(named: "GOOUT_SelectedMyPageImage"), for: .normal)
        mainTabBarView.allClassInquiryButton.setImage(UIImage(named: "GOOUT_AllClassInquiryButtonImage"), for: .normal)
    }
}
