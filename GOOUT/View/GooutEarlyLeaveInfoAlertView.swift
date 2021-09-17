//
//  GooutEalyLeaveInfoAlertView.swift
//  GOOUT
//
//  Created by Ji-hoon Ahn on 2021/09/15.
//

import UIKit
class GooutEarlyLeaceInfoAlertView : UIView{
    //MARK: - Properties
    let bgview = UIView()
    
    let kindShowView = UIView().then{
        $0.backgroundColor = .white
    }
    
    let requestStatus  : RequestStatus = {
       let view = RequestStatus()
        view.status.backgroundColor = .clear
        view.label.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Regular")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var nameLabel = UILabel().then{
        $0.textColor = UIColor.rgb(red: 97, green: 97, blue: 97)
        $0.dynamicFont(fontSize: 18, currentFontName: "AppleSDGothicNeo-SemiBold")
    }

    let numberLabel = UILabel().then{
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    let timeLabelButton = EarlyLeaveTimeToGoOutView().then{
        $0.layer.cornerRadius = 10
        $0.time.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-SemiBold")

    }
    
    lazy var reasonTextView = UITextView().then{
        $0.isEditable = false
        $0.textAlignment = .left
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    lazy var closeButton = UIButton().then{
        $0.setImage(UIImage(named: "GOOUT_CancelBtn"), for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = true
        $0.addTarget(self, action: #selector(animateOut), for: .touchUpInside)
    }
    
    let bound: CGRect = UIScreen.main.bounds
    
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.bgview.backgroundColor = .clear
        self.frame = UIScreen.main.bounds
        self.bgview.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animateOut)))
        layoutSetting()
    }
    
    @objc func animateOut(){
        UIView.animate(withDuration: 0.3) {
            self.alpha = 0
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        location()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func layoutSetting(){
        self.kindShowView.layer.shadowColor = UIColor.lightGray.cgColor
        self.kindShowView.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.kindShowView.layer.shadowRadius = 20
        self.kindShowView.layer.shadowOpacity = 0.3
        self.backgroundColor = .clear
        self.kindShowView.layer.cornerRadius = 10
        self.addSubview(bgview)
        self.addSubview(kindShowView)
        self.kindShowView.addSubview(requestStatus)
        self.kindShowView.addSubview(nameLabel)
        self.kindShowView.addSubview(numberLabel)
        self.kindShowView.addSubview(timeLabelButton)
        self.kindShowView.addSubview(reasonTextView)
        self.kindShowView.addSubview(closeButton)
    }
    func location(){
        timeLabelButton.sizeToFit()
        bgview.snp.makeConstraints { (make) in
            make.top.right.left.bottom.equalToSuperview()
        }
        kindShowView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(bounds.width/1.1646)
            make.height.equalTo(bounds.height/3.9038)
        }
        requestStatus.snp.makeConstraints { (make) in
            make.top.equalTo(kindShowView).offset(bounds.height/54.133)
            make.height.equalTo(bounds.height/67.6667)
            make.centerX.equalToSuperview()
            make.width.equalTo(bounds.width/7.35)
        }
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(requestStatus.snp.bottom).offset(bounds.height/54.133)
            $0.centerX.equalToSuperview()
        }
        numberLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameLabel.snp.bottom).offset(bounds.height/116)
        }
        timeLabelButton.snp.makeConstraints { (make) in
            make.top.equalTo(numberLabel.snp.bottom).offset(frame.height/81.2)
            make.centerX.equalToSuperview()
            make.height.equalTo(bounds.height/27.06667)
            make.width.equalTo(timeLabelButton.frame.width)
        }
        reasonTextView.snp.makeConstraints { (make) in
            make.top.equalTo(timeLabelButton.snp.bottom).offset(bounds.height/62.4615)
            make.bottom.equalTo(kindShowView.snp.bottom)
            make.left.right.equalToSuperview().inset(bounds.width/10.41)
            make.centerX.equalToSuperview()
        }
        closeButton.snp.makeConstraints { (make) in
            make.top.equalTo(kindShowView).offset(bounds.height/62.46)
            make.right.equalTo(kindShowView).inset(bounds.width/23.81)
            make.height.width.equalTo(frame.height/55.05)
        }
    }
}
