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
    static let identifier = "EarlyLeaveListTableCell"
    
    lazy var cellView = UIView().then {
        $0.backgroundColor = .rgb(red: 255, green: 255, blue: 255)
    }
    
    lazy var labelView = UIView().then {
        $0.backgroundColor = cellView.backgroundColor
    }
    
    lazy var nameLabel = UILabel().then {
        $0.text = "변웅섭"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = .rgb(red: 0, green: 0, blue: 0)
    }
    
    lazy var gradeClassNumLabel = UILabel().then {
        $0.text = "3학년 1반 7번"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = .rgb(red: 0, green: 0, blue: 0)
    }
    
    lazy var reasonLabel = UILabel().then {
        $0.text = "코로나 의심 증상"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = .rgb(red: 0, green: 0, blue: 0)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(cellView)
        cellView.addSubview(labelView)
        labelView.addSubview(nameLabel)
        labelView.addSubview(gradeClassNumLabel)
        labelView.addSubview(reasonLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureUI()
    }
    
    func configureUI(){
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
