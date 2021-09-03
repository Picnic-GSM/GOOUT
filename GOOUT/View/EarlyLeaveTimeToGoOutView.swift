//
//  EarlyLeaveTimeToGoOutView.swift
//  GOOUT
//
//  Created by Ji-hoon Ahn on 2021/09/02.
//

import UIKit

class EarlyLeaveTimeToGoOutView : UIView{
    let view = UIView().then{
        $0.backgroundColor = .red
    }
    
    let time = UILabel().then{
        $0.dynamicFont(fontSize: 11, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    init(startTimeString : String, finishTimeString : String?){
        super.init(frame: .zero)
        if ((finishTimeString?.isEmpty) != nil) {
            time.text = "\(startTimeString) - \(finishTimeString!)"
        }else{
            time.text = "\(startTimeString) ~"
        }
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
