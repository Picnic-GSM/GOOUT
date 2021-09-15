//
//  RequestStatus.swift
//  GOOUT
//
//  Created by Ji-hoon Ahn on 2021/08/31.
//

import UIKit
class RequestStatus : UIView{
    
    lazy var view = UIView()
    lazy var status = UIView()
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
        }
        status.snp.makeConstraints { (make) in
            make.centerY.equalTo(view)
            make.height.width.equalTo(7)
            make.left.equalTo(view)
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
