//
//  EarlyLeaveTimeToGoOutView.swift
//  GOOUT
//
//  Created by Ji-hoon Ahn on 2021/09/02.
//

import UIKit

class EarlyLeaveTimeToGoOutView : UIView{
    private let time = UILabel().then{
        $0.dynamicFont(fontSize: 11, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    init(startTimeString : String, finishTimeString : String?){
        super.init(frame: .zero)
        if ((finishTimeString?.isEmpty) != nil) {
            time.text = "\(startTimeString) - \(finishTimeString!)"
        }else{
            time.text = "\(startTimeString) ~"
        }
        addSubview(time)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        time.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
