//
//  OutConditionView.swift
//  GOOUT
//
//  Created by Ji-hoon Ahn on 2021/09/01.
//

import UIKit
class OutConditionView: UIView {
    let yellowView = UIView().then{
        $0.backgroundColor = .rgb(red: 255, green: 205, blue: 107)
    }
    let goingOut = UILabel().then{
        $0.text = "외출 중"
        $0.textColor = .black
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Thin")
    }
    let redView = UIView().then{
        $0.backgroundColor = .rgb(red: 255, green: 107, blue: 107)
    }
    let greenView = UIView().then{
        $0.backgroundColor = .rgb(red: 156, green: 198, blue: 160)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        
    }
    func addView(){
        addSubview(yellowView)
        addSubview(goingOut)
        addSubview(redView)
        addSubview(greenView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        yellowView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.height.width.equalTo(frame.height/1.71428)
            make.left.equalToSuperview()
        }
        goingOut.snp.makeConstraints { (make) in
            make.left.equalTo(yellowView.snp.right).offset(frame.height)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
