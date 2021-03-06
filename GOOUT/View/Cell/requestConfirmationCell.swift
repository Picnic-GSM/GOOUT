//
//  requestConfirmationCell.swift
//  GOOUT
//
//  Created by Ji-hoon Ahn on 2021/08/31.
//

import UIKit
class requestConfirmationCell : UICollectionViewCell {
    //MARK: - identifier
    static let identifier = "requestConfirmationCell"
    
    let requestStatus  : RequestStatus = {
       let view = RequestStatus()
        view.status.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let requestStudentName = UILabel().then{
        $0.dynamicFont(fontSize: 13, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = .black
    }
    let closeBtn = UIButton().then{
        $0.setImage(UIImage(named: "GOOUT_CancelBtn")?.withRenderingMode(.alwaysTemplate), for: .normal)
        $0.tintColor = .blue
    }
    let earlyLeaveTimeToGoOutLabel : EarlyLeaveTimeToGoOutView = {
        let view = EarlyLeaveTimeToGoOutView()
        return view
    }()
    let requestStudentClass = UILabel().then{
        $0.dynamicFont(fontSize: 9, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = .black
    }
    let reason = UILabel().then{
        $0.dynamicFont(fontSize: 9, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textAlignment = NSTextAlignment.center
        $0.textColor = .black
    }
    
    let btnApproval = UIButton().then{
        $0.setTitle("승인", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .red
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(closeBtn)
        contentView.addSubview(requestStatus)
        contentView.addSubview(requestStudentName)
        contentView.addSubview(requestStudentClass)
        contentView.addSubview(earlyLeaveTimeToGoOutLabel)
        contentView.addSubview(reason)
        contentView.addSubview(btnApproval)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        location()
    }
    func location(){
        closeBtn.snp.makeConstraints { (make) in
            make.height.width.equalTo(frame.height/22.8986)
            make.top.equalToSuperview().offset(frame.height/19.08212)
            make.right.equalToSuperview().inset(frame.width/13.718)
        }
        requestStatus.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(frame.height/9.875)
            make.width.equalTo(frame.height/3.09804)
            make.height.equalTo(frame.height/13.2)
            make.centerX.equalToSuperview()
        }
   
        requestStudentName.snp.makeConstraints { (make) in
            make.top.equalTo(requestStatus.snp.bottom).offset(frame.height/22.5714)
            make.centerX.equalToSuperview()
        }
        requestStudentClass.snp.makeConstraints { (make) in
            make.top.equalTo(requestStudentName.snp.bottom).offset(frame.height/22.5714)
            make.centerX.equalToSuperview()
        }
        earlyLeaveTimeToGoOutLabel.snp.makeConstraints { (make) in
            make.top.equalTo(requestStudentClass.snp.bottom).offset(frame.height/22.5714)
            make.centerX.equalToSuperview()
            make.height.equalTo(frame.height/6.945055)
            make.width.equalToSuperview()
        }
        reason.snp.makeConstraints { (make) in
            make.top.equalTo(earlyLeaveTimeToGoOutLabel.snp.bottom).offset(frame.height/21.79310)
            make.centerX.equalToSuperview()
            make.width.equalTo(frame.width/1.5714)
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
