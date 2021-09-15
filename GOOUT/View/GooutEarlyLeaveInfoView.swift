//
//  GooutEarlyLeaveInfoView.swift
//  GOOUT
//
//  Created by 김유진 on 2021/09/15.
//

import UIKit

class GooutEarlyLeaveInfoView: UIView {
    
    //MARK: - Properties
    lazy var kindShowView = UIView().then{
        $0.backgroundColor = .white
    }
    
    lazy var circleView = UIView().then{
        $0.backgroundColor = UIColor.rgb(red: 104, green: 134, blue: 197)
    }
    
    lazy var kindLabel = UILabel().then{
        $0.text = "외출요청"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Regular")
    }
    
    lazy var nameLabel = UILabel().then{
        $0.text = "변웅섭"
        $0.textColor = UIColor.rgb(red: 97, green: 97, blue: 97)
        $0.dynamicFont(fontSize: 18, currentFontName: "AppleSDGothicNeo-SemiBold")
    }

    lazy var numberLabel = UILabel().then{
        $0.text = "3학년 1반 1번"
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    lazy var timeLabelButton = UIButton().then{
        $0.backgroundColor = UIColor.rgb(red: 243, green: 247, blue: 255)
        $0.layer.cornerRadius = 10
        $0.setTitle("16:00 - 18:30", for: .normal)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.setTitleColor(UIColor.rgb(red: 104, green: 134, blue: 197), for: .normal)
        $0.isEnabled = true
    }
    
    lazy var reasonTextView = UITextView().then{
        $0.isEditable = false
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Thin")
        $0.text = "밥밥밥밥밥밥밥밥밥밥밥밥밥밥밥밥밥밥밥밥밥밥밥밥밥밥밥밥밥밥밥밥밥밥밥밥"
    }
    
    lazy var closeButton = UIButton().then{
        $0.setImage(UIImage(named: "GOOUT_CancelBtn"), for: .normal)
    }
    
    let bound: CGRect = UIScreen.main.bounds
    
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layoutSetting()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
        layoutSetting()
    }
    
    func layoutSetting(){
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.shadowRadius = 20
        self.layer.shadowOpacity = 0.3
        self.backgroundColor = .white
        
        self.addSubview(kindShowView)
        self.addSubview(nameLabel)
        self.addSubview(numberLabel)
        self.addSubview(timeLabelButton)
        self.addSubview(reasonTextView)
        self.addSubview(closeButton)
        kindShowView.addSubview(circleView)
        kindShowView.addSubview(kindLabel)


        
    }

}
