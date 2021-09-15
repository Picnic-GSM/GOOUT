//
//  WriteCodeTextfieldView.swift
//  GOOUT
//
//  Created by GSM01 on 2021/09/13.
//

import UIKit

class WriteCodeTextfieldView : UIView{
    
    let view = UIView()
    
    let tf = UITextField().then{
        $0.dynamicFont(fontSize: 11, currentFontName: "AppleSDGothicNeo-Light")
        $0.textColor = .black
    }
    let divider = UIView()
    
    init(placeholder : String) {
        super.init(frame: .zero)
        tf.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.rgba(red: 196, green: 196, blue: 196, alpha: 1)])
        addSubview(view)
        view.addSubview(tf)
        view.addSubview(divider)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        view.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(divider.snp.bottom)
        }
        tf.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
        }
        divider.snp.makeConstraints { (make) in
            make.top.equalTo(tf.snp.bottom).offset(frame.height/2.444)
            make.left.right.equalToSuperview()
            make.height.equalTo(0.6)
        }
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 0.6))
        let gradient = CAGradientLayer()

        gradient.frame = view.bounds
        gradient.colors = [UIColor(red: 255/255, green: 173/255, blue: 172/255, alpha: 1).cgColor, UIColor(red: 104/255, green: 134/255, blue: 197/255, alpha: 1).cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)

        divider.layer.insertSublayer(gradient, at: 0)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
