//
//  EarlyLeaveListTableCell.swift
//  GOOUT
//
//  Created by 노연주 on 2021/09/11.
//

import UIKit
import SnapKit
import Then

class EarlyLeaveListTableCell: UITableViewCell {
    static let EarlyLeaveListTableIdentifier = "\(EarlyLeaveListTableCell.self)"
    
    var cellView = UIView().then {
        $0.backgroundColor = .rgb(red: 255, green: 255, blue: 255)
    }
    
    var nameLabel = UILabel().then {
        $0.text = "변웅섭"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = .rgb(red: 0, green: 0, blue: 0)
    }
    
    var gradeClassNumLabel = UILabel().then {
        $0.text = "3학년 1반 7번"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = .rgb(red: 0, green: 0, blue: 0)
    }
    
    var reasonLabel = UILabel().then {
        $0.text = "코로나 의심 증상"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = .rgb(red: 0, green: 0, blue: 0)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureUI(){
        contentView.addSubview(cellView)
        cellView.addSubview(nameLabel)
        cellView.addSubview(gradeClassNumLabel)
        cellView.addSubview(reasonLabel)
        
        cellView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.14)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(cellView).offset(36)
        }
        
        gradeClassNumLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(nameLabel.snp.right).offset(42)
        }
        
        reasonLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(gradeClassNumLabel.snp.right).offset(62)
        }
    }
    
    
}
