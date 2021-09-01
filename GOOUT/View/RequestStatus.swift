//
//  RequestStatus.swift
//  GOOUT
//
//  Created by Ji-hoon Ahn on 2021/08/31.
//

import UIKit
class RequestStatus : UIView{
    
    let view = UIView()
    let status = UIView()
    let label = UILabel().then{
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Regular")
        $0.sizeToFit()
        $0.textColor = .black
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(view)
        view.addSubview(status)
        view.addSubview(label)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        status.layer.cornerRadius = status.frame.height/2
        view.snp.makeConstraints { (make) in
            make.top.left.bottom.equalToSuperview()
            make.right.equalTo(label.snp.right)
            make.height.equalTo(label.frame.height)
        }
        status.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.height.width.equalTo(7)
            make.left.equalToSuperview()
        }
        label.snp.makeConstraints { (make) in
            make.left.equalTo(status.snp.right).offset(6)
            make.centerY.equalToSuperview()
        }

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
