//
//  StateExplainView.swift
//  GOOUT
//
//  Created by 노연주 on 2021/09/10.
//

import UIKit
import Then
import SnapKit

class StateExplainView: UIView{
    
    //MARK: - property
    
    lazy var stateColorView = UIView().then {
        $0.backgroundColor = .rgb(red: 255, green: 205, blue: 107)
        $0.layer.cornerRadius = 3.5
    }
    
    lazy var stateLabel = UILabel().then {
        $0.text = "외출 중"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    func stateViewSetting(screenHeight: CGFloat, screenWidth: CGFloat){
        stateColorView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.width.height.equalTo(screenWidth/53.57)
        }
        
        stateLabel.snp.makeConstraints { make in
            make.centerY.equalTo(stateColorView)
            make.left.equalTo(stateColorView.snp.right).offset(screenWidth/62.5)
        }
    }
}
