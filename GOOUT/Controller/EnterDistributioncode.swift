//
//  EnterDistributioncode.swift
//  GOOUT
//
//  Created by GSM01 on 2021/09/07.
//

import Foundation
import UIKit
import SnapKit
import Then

class EnterDistributioncode: UIViewController {

    let logoview = UIView().then {
        $0.layer.cornerRadius = 20
    }
    
    let passthroughview = UIView()
    
    
    
    let bound = UIScreen.main.bounds
    lazy var boxbound = boxview.bounds
    lazy var boxview = UIView(frame: CGRect(x: 0, y: 0, width: bound.width*0.688, height: bound.height*0.441)).then { made in
        made.backgroundColor  = .white
        made.layer.cornerRadius = 20
        
    }
    
    private let iv = UIImageView().then{
        $0.image = UIImage(named: "GOOUT_Logo")
        $0.contentMode = .scaleAspectFill
    }
    private let writeCodeTitleLabel = UILabel().then{
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = .black
        $0.text = "배부받은 코드를 입력해주세요!"
    }
    
    lazy var viewForButton = UIView().then {
        $0.frame = CGRect(x: 0, y: 0, width: bound.width*0.266, height: bound.height*0.043)
    }
    
    lazy var btn = UIButton().then{
        $0.layer.cornerRadius = 10
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    lazy var whiteview = UIView().then {
        $0.backgroundColor = .white
        $0.frame = viewForButton.frame
        $0.layer.cornerRadius = 6
    }
    
   
    
    private let writeCodeTextfield = WriteCodeTextfieldView(placeholder: "배부받은 코드를 입력해주세요")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setgredient()
        drupshadow()
        addview()
        location()
        logogredient()
        let view = UIView(frame: CGRect(x: 0, y: 0, width: boxview.bounds.width*0.85, height: boxview.bounds.height * 0.456))
        let gradient = CAGradientLayer()
        gradient.locations = [0, 1]

        gradient.startPoint = CGPoint(x: 0.25, y: 0.5)

        gradient.endPoint = CGPoint(x: 0.75, y: 0.5)
        gradient.frame = view.bounds
        gradient.colors = [UIColor(red: 255/255, green: 243/255, blue: 243/255, alpha: 1).cgColor, UIColor(red: 243/255, green: 247/255, blue: 255/255, alpha: 1).cgColor]
        
        logoview.layer.insertSublayer(gradient, at: 0)
        viewForButton.gradientButton("확인", btn, startColor: .rgb(red: 255, green: 172, blue: 183), endColor: .rgb(red: 104, green: 134, blue: 197))
    }

    
    
    func addview() {
        view.addSubview(boxview)
        boxview.addSubview(logoview)
        boxview.addSubview(passthroughview)
        logoview.addSubview(iv)
        boxview.addSubview(writeCodeTitleLabel)
        boxview.addSubview(writeCodeTextfield)
        view.addSubview(whiteview)
        whiteview.addSubview(viewForButton)
    }
    
    
    
    func location() {
        boxview.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(view).offset(bound.height*0.216)
            make.height.equalTo(bound.height*0.441)
            make.width.equalTo(bound.width*0.688)
        }
        
        logoview.snp.makeConstraints { make in
            make.centerX.equalTo(boxview)
            make.top.equalTo(boxview).offset(boxbound.height*0.064)
            make.height.equalTo(boxbound.height*0.456)
            make.width.equalTo(boxbound.width*0.85)
        }
        iv.snp.makeConstraints { (make) in
            make.center.equalTo(logoview)
            make.height.equalTo(bound.height/11.92)
            make.width.equalTo(bound.width/2.54)
        }
        writeCodeTitleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(boxview)
            make.top.equalTo(logoview.snp.bottom).offset(bound.height/21.413)
        }
        writeCodeTextfield.snp.makeConstraints{ (make) in
            make.left.right.equalTo(boxview).inset(bound.width/9)
            make.height.equalTo(bound.height/36.9)
            make.top.equalTo(logoview.snp.bottom).offset(bound.height/8)
        }
        whiteview.snp.makeConstraints { (make) in
            make.top.equalTo(boxview.snp.bottom).offset(bound.height/11.6)
            make.centerX.equalToSuperview()
            make.height.equalTo(bound.height/23.2)
            make.left.right.equalToSuperview().inset(bound.width/2.72)
        }
        viewForButton.snp.makeConstraints {
            $0.top.centerX.height.left.right.equalTo(whiteview)
        }
        
    }
    
    func drupshadow() {
        boxview.layer.shadowOpacity = 0.4
        boxview.layer.shadowOffset = CGSize(width: 0, height: 4)
        boxview.layer.shadowRadius = 7
        boxview.layer.masksToBounds = false
    }
    
    
    // MARK: setgredient
    
    
    func logogredient() {
        
        logoview.clipsToBounds = true

        let layer1 = CAGradientLayer()

        layer1.colors = [

            UIColor(red: 1, green: 0.87, blue: 0.87, alpha: 1).cgColor,
            UIColor(red: 0.87, green: 0.87, blue: 1, alpha: 1).cgColor
        ]

        layer1.locations = [0, 1]

        layer1.startPoint = CGPoint(x: 0.25, y: 0.5)

        layer1.endPoint = CGPoint(x: 0.75, y: 0.5)

        layer1.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 1, b: 0.97, c: -0.97, d: 0.38, tx: 0.49, ty: -0.16))

        layer1.bounds = logoview.bounds.insetBy(dx: -0.5*logoview.bounds.size.width, dy: -0.5*logoview.bounds.size.height)

        layer1.position = logoview.center
        logoview.layer.addSublayer(layer1)
    }

    func setgredient() {
        
        view.clipsToBounds = true

        let layer1 = CAGradientLayer()

        layer1.colors = [

            UIColor(red: 1, green: 0.87, blue: 0.87, alpha: 1).cgColor,
            UIColor(red: 0.87, green: 0.87, blue: 1, alpha: 1).cgColor
        ]

        layer1.locations = [0, 1]

        layer1.startPoint = CGPoint(x: 0.25, y: 0.5)

        layer1.endPoint = CGPoint(x: 0.75, y: 0.5)

        layer1.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 1, b: 0.97, c: -0.97, d: 0.38, tx: 0.49, ty: -0.16))

        layer1.bounds = view.bounds.insetBy(dx: -0.5*view.bounds.size.width, dy: -0.5*view.bounds.size.height)

        layer1.position = view.center

        view.layer.addSublayer(layer1)
    }
}
