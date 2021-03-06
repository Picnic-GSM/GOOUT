//
//  MainTabBarView.swift
//  GOOUT
//
//  Created by 김유진 on 2021/08/30.
//

import UIKit
import Then
import SnapKit

class MainTabBarView: UIView{
    
    //MARK: - property
    var lineViewGradient: CAGradientLayer!
    
    lazy var allClassInquiryButton = UIButton().then{
        $0.setImage(UIImage(named: "GOOUT_SelectedAllClassInquiryButtonImage"), for: .normal)
    }
    
    lazy var addButton = UIButton().then{
        $0.setImage(UIImage(named: "GOOUT_MyClassInquiryButtonImage"), for: .normal)
    }
    
    lazy var myClassInquiryButton = UIButton().then{
        $0.setImage(UIImage(named: "GOOUT_MyPageImage"), for: .normal)
    }
    
    lazy var lineView = UIView().then{
        $0.backgroundColor = .white
    }
    
    //MARK: - lifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layoutSetting()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - layoutSetting
    func layoutSetting(){
        self.backgroundColor = .white
        
        self.addSubview(lineView)
        self.addSubview(addButton)
        self.addSubview(myClassInquiryButton)
        self.addSubview(allClassInquiryButton)
        
    }
}
