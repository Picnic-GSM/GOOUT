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
    var lineViewGradient: CAGradientLayer!
    
    lazy var homeButton = UIButton().then{
        $0.setImage(UIImage(named: "GOOUT_HomeButtonImage"), for: .normal)
    }
    
    lazy var lineView = UIView().then{
        $0.backgroundColor = .white
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layoutSetting()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layoutSetting(){
        self.backgroundColor = .white
        
        self.addSubview(lineView)
        
    }
}
