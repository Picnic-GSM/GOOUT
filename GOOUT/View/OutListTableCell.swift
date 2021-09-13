//
//  OutListTableCell.swift
//  GOOUT
//
//  Created by 노연주 on 2021/09/11.
//

import UIKit
import SnapKit
import Then
class OutListTableCell: UITableViewCell{
    static let OutListTableIdentifier = "\(OutListTableCell.self)"
    
    var cellView = UIView().then {
        $0.backgroundColor = .rgb(red: 255, green: 255, blue: 255)
    }
    
    var stateColorView = UIView().then {
        $0.backgroundColor = .rgb(red: 255, green: 205, blue: 107)
        $0.layer.cornerRadius = 3.5
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
    
    var timeLabel = UILabel().then {
        $0.text = "16:30 - 18:00"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = .rgb(red: 0, green: 0, blue: 0)
    }
    
    var reasonLabel = UILabel().then {
        $0.text = "준비물"
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
        cellView.addSubview(stateColorView)
        cellView.addSubview(nameLabel)
        cellView.addSubview(gradeClassNumLabel)
        cellView.addSubview(timeLabel)
        cellView.addSubview(reasonLabel)
        
        cellView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.14)
        }
        
        stateColorView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(17)
            make.width.equalTo(cellView).dividedBy(47.14)
            make.height.equalTo(stateColorView.snp.width)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(stateColorView.snp.right).offset(24)
        }
        
        gradeClassNumLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(nameLabel.snp.right).offset(37)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(gradeClassNumLabel.snp.right).offset(27)
        }
        
        reasonLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(timeLabel.snp.right).offset(27)
        }
    }
    
    
}
