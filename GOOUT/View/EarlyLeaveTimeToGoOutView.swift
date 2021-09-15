//
//  EarlyLeaveTimeToGoOutView.swift
//  GOOUT
//
//  Created by Ji-hoon Ahn on 2021/09/02.
//

import UIKit

class EarlyLeaveTimeToGoOutView : UIView{
    let view = UIView().then{
        $0.backgroundColor = .rgb(red: 243, green: 247, blue: 255)
    }
    
    let time = UILabel().then{
        $0.dynamicFont(fontSize: 11, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(view)
        view.addSubview(time)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        time.sizeToFit()
        view.layer.cornerRadius = frame.height/2.275
        view.snp.makeConstraints { (make) in
            make.width.equalTo(time.frame.width + frame.width/3.21)
            make.height.equalToSuperview()
            make.center.equalToSuperview()
        }
        time.snp.makeConstraints { (make) in
            make.center.equalTo(view.snp.center)
        }

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
