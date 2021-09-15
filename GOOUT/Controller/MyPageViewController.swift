//
//  MyPageViewController.swift
//  GOOUT
//
//  Created by 김유진 on 2021/09/15.
//

import UIKit

class MyPageViewController: UIViewController {
    
    //MARK: - Properties
    lazy var myPageTitleLabel = UILabel().then {
        $0.text = "My Page"
        $0.dynamicFont(fontSize: 25, currentFontName: "FugazOne-Regular")
        $0.textColor = .rgb(red: 255, green: 168, blue: 179)
    }

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutSetting()
    }
    
    //MARK: - layoutSetting
    func layoutSetting(){
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(myPageTitleLabel)
        
        myPageTitleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/11.5)
            make.top.equalToSuperview().offset(self.view.frame.height/11.44)
        }
        
    }

}
