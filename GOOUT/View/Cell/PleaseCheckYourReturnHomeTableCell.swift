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
    private var pleaseCheckYourReturnHome : Bool = false
    
    let cellView = UIView().then{
        $0.layer.borderWidth = 1
        $0.clipsToBounds = true
        $0.layer.borderColor = UIColor.rgb(red: 104, green: 134, blue: 197).cgColor
    }
    let view = UIView()
    let requestStatus = UIView()
    let requestStudentName = UILabel().then{
        $0.dynamicFont(fontSize: 13, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = .black
    }
    let requestStudentClass = UILabel().then{
        $0.dynamicFont(fontSize: 9, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = .black
    }
    let earlyLeaveTimeToGoOutLabel : EarlyLeaveTimeToGoOutView = {
        let view = EarlyLeaveTimeToGoOutView()
        return view
    }()
    lazy var attendanceButton = UIButton().then{
        $0.setTitleColor(.white, for: .normal)
        $0.dynamicFont(fontSize: 11, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.addTarget(self, action: #selector(attendanceBtn), for: .touchUpInside)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cellView)
        cellView.addSubview(view)
        view.addSubview(requestStatus)
        view.addSubview(requestStudentName)
        view.addSubview(requestStudentClass)
        cellView.addSubview(earlyLeaveTimeToGoOutLabel)
        cellView.addSubview(attendanceButton)
        backgroundColor = .clear
        requestStatus.backgroundColor = .red
    }
    @objc func attendanceBtn(){
        if pleaseCheckYourReturnHome == true{
            UIView.animate(withDuration: 0.2) {
                self.attendanceButton.backgroundColor = .rgb(
                    red: 104, green: 134, blue: 197)
                self.attendanceButton.setTitle("귀가 완료", for: .normal)
                self.earlyLeaveTimeToGoOutLabel.time.textColor = .rgb(red: 104, green: 104, blue: 197)
                self.earlyLeaveTimeToGoOutLabel.view.backgroundColor = .rgb(red: 243, green: 247, blue: 255)
                self.cellView.layer.borderColor = UIColor.rgb(red: 104, green: 134, blue: 197).cgColor
            }
        }else{
            UIView.animate(withDuration: 0.2) {
                self.attendanceButton.backgroundColor = .rgb(red: 255, green: 168, blue: 179)
                self.attendanceButton.setTitle("귀가 취소", for: .normal)
                self.earlyLeaveTimeToGoOutLabel.time.textColor = .rgb(red: 243, green: 131, blue: 146)
                self.earlyLeaveTimeToGoOutLabel.view.backgroundColor = .rgb(red: 255, green: 243, blue: 243)
                self.cellView.layer.borderColor = UIColor.rgb(red: 255, green: 221, blue: 221).cgColor
            }
        }
        pleaseCheckYourReturnHome = !pleaseCheckYourReturnHome
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
            make.top.equalTo(requestStudentName.snp.top)
            make.bottom.equalTo(requestStudentClass.snp.bottom)
            make.width.equalTo(frame.width/6.79592)
            make.centerY.equalTo(cellView.snp.centerY)
            make.left.equalTo(cellView.snp.left).offset(frame.width/16.65)
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
            make.top.equalTo(requestStudentName.snp.bottom).offset(frame.height/34.5)
            make.centerX.equalTo(view)
        }
        attendanceButton.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.top.bottom.equalTo(cellView)
            make.width.equalTo(frame.width/4.573170)
        }
        earlyLeaveTimeToGoOutLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(attendanceButton.snp.left).offset(frame.width/15 * -1)
            make.height.equalTo(frame.height/2.7187)
            make.width.equalTo(frame.width/3.64077)
        }
 
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
