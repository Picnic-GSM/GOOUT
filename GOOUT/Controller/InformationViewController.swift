//
//  InformationViewController.swift
//  GOOUT
//
//  Created by GSM02 on 2021/09/08.
//

import UIKit
import SnapKit
import Then

class InformationViewController: UIViewController {
    
    lazy var informationLabel = UILabel().then {
        $0.text = "Information"
        $0.dynamicFont(fontSize: 30, currentFontName: "FugazOne-Regular")
        $0.textColor = .rgb(red: 255, green: 172, blue: 183)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        self.view.backgroundColor = .white
        addSubView()
        cornerRadius()
        location()
    }
    
    func addSubView() {
        self.view.addSubview(informationLabel)
    }
    
    func cornerRadius() {
        
    }
    
    func location() {
        informationLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/7.96)
            make.left.equalToSuperview().offset(self.view.frame.width/8.52)
        }
    }
}


//MARK: - Preview

#if DEBUG
import SwiftUI
struct InformationViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        InformationViewController()
    }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            InformationViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif