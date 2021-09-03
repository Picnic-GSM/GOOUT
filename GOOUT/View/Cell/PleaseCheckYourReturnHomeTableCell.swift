//
//  PleaseCheckYourReturnHomeTableCell.swift
//  GOOUT
//
//  Created by Ji-hoon Ahn on 2021/09/02.
//

import UIKit
class PleaseCheckYourReturnHomeTableCell: UITableViewCell {
    //MARK: - identifier
    static let identifier = "PleaseCheckYourReturnHomeTableCell"
    
    let cellView = UIView().then{
        $0.layer.borderWidth = 1
        $0.clipsToBounds = true
        $0.layer.borderColor = UIColor.red.cgColor
    }
    let view = UIView()
    let requestStatus = UIView()
    let requestStudentName = UILabel().then{
        $0.dynamicFont(fontSize: 13, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = .black
        $0.text = "변웅섭"
    }
    let requestStudentClass = UILabel().then{
        $0.text = "3학년 1반 7번"
        $0.dynamicFont(fontSize: 9, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = .black
    }
    let earlyLeaveTimeToGoOutLabel : EarlyLeaveTimeToGoOutView = {
        let view = EarlyLeaveTimeToGoOutView(startTimeString: "11:00", finishTimeString: "12:00")
        view.backgroundColor = .red
        return view
    }()
    let attendanceButton = UIButton().then{
        $0.backgroundColor = .red
        $0.setTitle("출석완료", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.dynamicFont(fontSize: 11, currentFontName: "AppleSDGothicNeo-SemiBold")
    }

    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(cellView)
        cellView.addSubview(view)
        view.addSubview(requestStatus)
        view.addSubview(requestStudentName)
        view.addSubview(requestStudentClass)
        cellView.addSubview(earlyLeaveTimeToGoOutLabel)
        cellView.addSubview(attendanceButton)
        backgroundColor = .clear
        requestStatus.backgroundColor = .red
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        cellView.layer.cornerRadius = frame.height/6.9
        requestStatus.layer.cornerRadius = requestStatus.frame.height/2
        location()
    }
    func location(){
        cellView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(frame.width/17.85)
            make.height.equalTo(frame.height/1.23214)
        }
        earlyLeaveTimeToGoOutLabel.layer.cornerRadius = 10
        view.snp.makeConstraints { (make) in
            make.height.equalTo(frame.height/1.86667)
            make.width.equalTo(frame.width/6.79592)
            make.centerY.equalToSuperview()
            make.left.equalTo(snp.left).offset(frame.width/16.65)
        
        }
        requestStatus.snp.makeConstraints { (make) in
            make.height.equalTo(frame.height/8)
            make.width.equalTo(requestStatus.snp.height)
            make.left.equalTo(view.snp.left)
            make.centerY.equalTo(requestStudentName)
        }
        requestStudentName.snp.makeConstraints { (make) in
            make.top.equalTo(view)
            make.left.equalTo(requestStatus.snp.right).offset(frame.width/41.625)
        }
        requestStudentClass.snp.makeConstraints { (make) in
            make.bottom.equalTo(view)
            make.centerX.equalTo(view)
        }
        earlyLeaveTimeToGoOutLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(attendanceButton.snp.left).offset(frame.width/13.32 * -1)
            make.height.equalTo(frame.height/2.2064)
            make.width.equalTo(frame.width/3.23)
        }
        attendanceButton.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.height.equalTo(frame.height)
            make.width.equalTo(frame.width/4.060975)
        }
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
