//
//  MyClassInquiryViewController.swift
//  GOOUT
//
//  Created by 김유진 on 2021/08/30.
//

import UIKit
import Then
import SnapKit

class MyClassInquiryViewController: UIViewController{
    // MARK: - property
    lazy var mainTabBarView = MainTabBarView()
    
    // MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutSetting()
    }
    
    // MARK: - layoutSetting
    func layoutSetting(){
        self.view.backgroundColor = .orange
    }
}
