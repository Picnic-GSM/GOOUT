//
//  SigninVIewController.swift
//  GOOUT
//
//  Created by baegteun on 2021/08/30.
//

import UIKit
import Then
import SnapKit

class SigninViewController: UIViewController{
    // MARK: - Properties
    private let mainBound = UIScreen.main.bounds
    lazy var signinImage = UIImageView(image: UIImage(named: "GOOUT_SigninLogo"))
    lazy var formView = SigninView(frame: CGRect(x: 0, y: 0, width: mainBound.width, height: mainBound.height*0.75))
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubView()
        configureUI()
    }
    
    // MARK: - Helpers
    func addSubView(){
        view.addSubview(signinImage)
        view.addSubview(formView)
        
    }
    
    // MARK: - configureUI
    func configureUI(){
        
        signinImage.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(mainBound.height/8)
            $0.left.equalTo(view.snp.left).offset(mainBound.width/9)
            $0.height.equalTo(mainBound.height*0.055)
            $0.width.equalTo(mainBound.width*0.264)
        }
        
        formView.snp.makeConstraints {
            $0.left.bottom.right.equalToSuperview()
            $0.width.equalTo(mainBound.width)
            $0.height.equalTo(mainBound.height*0.75)
        }
        
        
        
    }
    
    
    
}
