//
//  OutConditionView.swift
//  GOOUT
//
//  Created by Ji-hoon Ahn on 2021/09/01.
//

import UIKit
class OutConditionView: UIView {
    let view = UIView()
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
    let timeOver = UILabel().then{
        $0.text = "시간초과"
        $0.textColor = .black
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Thin")
    }
    let greenView = UIView().then{
        $0.backgroundColor = .rgb(red: 156, green: 198, blue: 160)
    }
    let returnHomeComplete = UILabel().then{
        $0.text = "귀가완료"
        $0.textColor = .black
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
    }
    func addView(){
        addSubview(view)
        view.addSubview(yellowView)
        view.addSubview(goingOut)
        view.addSubview(redView)
        view.addSubview(timeOver)
        view.addSubview(greenView)
        view.addSubview(returnHomeComplete)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        yellowView.layer.cornerRadius = yellowView.frame.height/2
        redView.layer.cornerRadius = redView.frame.height/2
        greenView.layer.cornerRadius = greenView.frame.height/2
        view.snp.makeConstraints { (make) in
            make.left.equalTo(yellowView.snp.left)
            make.height.equalToSuperview()
            make.right.equalTo(returnHomeComplete.snp.right)
        }
        yellowView.snp.makeConstraints { (make) in
            make.centerY.equalTo(goingOut.snp.centerY)
            make.height.width.equalTo(frame.height/1.71428)
            make.left.equalToSuperview()
        }
        goingOut.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalTo(yellowView.snp.right).offset(frame.height/2)
        }
        redView.snp.makeConstraints { (make) in
            make.centerY.equalTo(timeOver.snp.centerY)
            make.height.width.equalTo(frame.height/1.71428)
            make.left.equalTo(goingOut.snp.right).offset(frame.height/1.5)
        }
        timeOver.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalTo(redView.snp.right).offset(frame.height/2)
        }
        greenView.snp.makeConstraints { (make) in
            make.height.width.equalTo(frame.height/1.71428)
            make.centerY.equalTo(returnHomeComplete.snp.centerY)
            make.left.equalTo(timeOver.snp.right).offset(frame.height/1.5)
        }
        returnHomeComplete.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalTo(greenView.snp.right).offset(frame.height/2)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
