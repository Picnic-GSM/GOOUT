//
//  requestConfirmationCell.swift
//  GOOUT
//
//  Created by Ji-hoon Ahn on 2021/08/31.
//

import UIKit
class requestConfirmationCell : UICollectionViewCell {
    static let identifier = "requestConfirmationCell"
    
    let requestStatus  : RequestStatus = {
       let view = RequestStatus()
        view.label.text = "외출 요청"
        view.status.backgroundColor = .blue
        return view
    }()

    let btnApproval = UIButton().then{
        $0.setTitle("승인", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .red
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(requestStatus)
        addSubview(btnApproval)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        requestStatus.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(frame.height/9.875)
            make.width.equalTo(frame.height/3.09804)
            make.height.equalTo(frame.height/13.166667)
            make.centerX.equalToSuperview()
        }
        btnApproval.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(frame.height/6.32)
            make.bottom.equalToSuperview()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
