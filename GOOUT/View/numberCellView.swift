//
//  numberCellView.swift
//  GOOUT
//
//  Created by GSM02 on 2021/09/14.
//

import UIKit
import SnapKit
import Then

class numberCellView: UICollectionViewCell {
    static let identifier = "\(numberCellView.self)"
    
    var backView = UIView().then {
        $0.backgroundColor = .white
    }
    
    var numButton = UIButton().then {
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.setTitleColor(.rgb(red: 108, green: 108, blue: 108), for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    override var isSelected: Bool {
      didSet {
        if isSelected {
            numButton.setTitleColor(.rgb(red: 255, green: 174, blue: 185), for: .normal)
        } else {
            numButton.setTitleColor(.rgb(red: 108, green: 108, blue: 108), for: .normal)
        }
      }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    func configureUI(){
        contentView.addSubview(backView)
        backView.addSubview(numButton)
        
        backView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        numButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(30)
            make.height.equalTo(20)
        }
    }
}

