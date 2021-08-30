//
//  SigninView.swift
//  GOOUT
//
//  Created by baegteun on 2021/08/30.
//

import UIKit
import Then
import SnapKit

class SigninView: UIView{
    // MARK: - Properties
    private let mainBound = UIScreen.main.bounds
    
    
    
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        configureShadow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - configureShadow
    func configureShadow(){
        
        let shadows = UIView().then{
            $0.frame = self.frame
            $0.clipsToBounds = false
        }
        
        let shadowPath0 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: mainBound.width*0.12)
        
        let layer0 = CALayer().then{
            $0.shadowPath = shadowPath0.cgPath
            $0.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            $0.shadowOpacity = 1
            $0.shadowRadius = 10
            $0.shadowOffset = CGSize(width: 0, height: 4)
            $0.bounds = shadows.bounds
            $0.position = shadows.center
        }
        
        let shapes = UIView().then{
            $0.frame = self.frame
            $0.clipsToBounds = true
        }
        
        let layer1 = CALayer().then{
            $0.backgroundColor = UIColor(red: 0.954, green: 0.969, blue: 1, alpha: 1).cgColor
            $0.cornerRadius = mainBound.width*0.12
            $0.bounds = shapes.bounds
            $0.position = shapes.center
        }
        
        self.addSubview(shadows)
        shadows.layer.addSublayer(layer0)
        self.addSubview(shapes)
        shapes.layer.addSublayer(layer1)
    }
}
