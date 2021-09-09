//
//  ViewController.swift
//  GOOUT
//
//  Created by 김유진 on 2021/08/27.
//

import UIKit
import Then
import SnapKit
import DropDown

class InquiryByGradeViewController : UIViewController {
    
    //MARK: - Properties
    lazy var mainTabBarView = MainTabBarView()
    
    lazy var viewControllerView = UIView().then{
        $0.backgroundColor = .white
    }
    
    lazy var dropLabelBtn = UIButton().then {
        $0.backgroundColor = .white
    }

    lazy var gradeLabel = UILabel().then {
        $0.text = "3rd Grade"
        $0.dynamicFont(fontSize: 25, currentFontName: "FugazOne-Regular")
        $0.textColor = .rgb(red: 104, green: 134, blue: 197)
    }
    
    lazy var downBtn = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "GOOUT_GradeUnderButtonImage"), for: .normal)
    }
    
    lazy var gradeDropDown = DropDown().then {
        $0.dataSource = ["1st Grade", "2nd Grade", "3rd Grade"]
        $0.textFont = UIFont(name: "FugazOne-Regular", size: 20)!
        $0.direction = .bottom
        $0.anchorView = dropLabelBtn
        $0.bottomOffset = CGPoint(x: 0, y:self.view.frame.height/21.95)
        $0.backgroundColor = UIColor.white
        $0.cornerRadius = 7
        $0.cellHeight = self.view.frame.height/26
        $0.shadowColor = UIColor.lightGray
        $0.shadowOffset = CGSize(width: 0, height: 3)
        $0.shadowRadius = 10
        $0.shadowOpacity = 0.3
        $0.textColor = .rgb(red: 104, green: 134, blue: 197)
        $0.selectedTextColor = .rgb(red: 104, green: 134, blue: 197)
        $0.width = self.view.frame.width/2.5
        $0.customCellConfiguration = { (index, item, cell) in
            cell.optionLabel.textAlignment = .center
        }
    }
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Helpers
    func configureUI(){
        view.backgroundColor = .white
        
        layoutSetting()
        
        mainTabBarViewSetting()
        
        addView()
        cornerRadius()
        location()
    }
    
    func addView(){
        view.addSubview(dropLabelBtn)
        view.addSubview(gradeLabel)
        view.addSubview(downBtn)
    }
    
    func cornerRadius(){
        
    }
    
    func location(){
        dropLabelBtn.snp.makeConstraints { make in
            make.left.equalTo(self.view.frame.width/12.5)
            make.top.equalTo(self.view.frame.height/11.44)
            make.width.equalToSuperview().dividedBy(2.5)
            make.height.equalToSuperview().dividedBy(21.95)
        }
        
        downBtn.snp.makeConstraints { make in
            make.centerY.equalTo(dropLabelBtn)
            make.right.equalTo(dropLabelBtn)
            make.width.equalTo(self.view.frame.width/31.25)
            make.height.equalTo(self.view.frame.height/101.5)
        }
        
        gradeLabel.snp.makeConstraints { make in
            make.left.equalTo(dropLabelBtn)
            make.centerY.equalTo(dropLabelBtn)
        }
    }
    //MARK: - Selectors
    
    // MARK: - myClassInquiryButtonClicked
    @objc func myClassInquiryButtonClicked(sender:UIButton){
        viewControllerView.isHidden = false
        mainTabBarView.myClassInquiryButton.setImage(UIImage(named: "GOOUT_SelectedMyClassInquiryButtonImage"), for: .normal)
        mainTabBarView.allClassInquiryButton.setImage(UIImage(named: "GOOUT_AllClassInquiryButtonImage"), for: .normal)
    }
    
    // MARK: - allClassInquiryButtonClicked
    @objc func allClassInquiryButtonClicked(sender:UIButton){
        viewControllerView.isHidden = true
        mainTabBarView.myClassInquiryButton.setImage(UIImage(named: "GOOUT_MyClassInquiryButtonImage"), for: .normal)
        mainTabBarView.allClassInquiryButton.setImage(UIImage(named: "GOOUT_SelectedAllClassInquiryButtonImage"), for: .normal)
    }
    
    //MARK: - addButtonClicked
    @objc func addButtonClicked(sender:UIButton){
        let nextVC = AddViewController()
        present(nextVC, animated: true)
    }
    
    // MARK: - layoutSetting
    func layoutSetting(){
        self.view.backgroundColor = .white
        
        self.view.addSubview(mainTabBarView)
        self.view.addSubview(viewControllerView)
        
        viewControllerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalToSuperview().offset(-self.view.frame.height/10.15)
        }

        // myClassInquiryViewController 화면전환 준비
        let myClassInquiryViewController = MyClassInquiryViewController()
        self.addChild(myClassInquiryViewController)
        myClassInquiryViewController.view.frame = viewControllerView.frame
        
        viewControllerView.addSubview(myClassInquiryViewController.view)
        
        viewControllerView.isHidden = true
    }
    
    // MARK: - mainTabBarViewSetting
    func mainTabBarViewSetting(){
        mainTabBarView.allClassInquiryButton.setImage(UIImage(named: "GOOUT_SelectedAllClassInquiryButtonImage"), for: .normal)
        
        mainTabBarView.myClassInquiryButton.addTarget(self, action: #selector(myClassInquiryButtonClicked(sender:)), for: .touchUpInside)
        mainTabBarView.allClassInquiryButton.addTarget(self, action: #selector(allClassInquiryButtonClicked(sender:)), for: .touchUpInside)
        mainTabBarView.addButton.addTarget(self, action: #selector(addButtonClicked(sender:)), for: .touchUpInside)
        
        mainTabBarView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(10.15)
        }
        
        mainTabBarView.lineView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(2)
            make.centerX.equalToSuperview()
        }
        
        mainTabBarView.addButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(14.37)
            make.height.equalTo(mainTabBarView.addButton.snp.width)
            make.top.equalTo(mainTabBarView.lineView.snp.bottom).offset(self.view.frame.height/58)
        }
        
        mainTabBarView.allClassInquiryButton.snp.makeConstraints { make in
            make.centerY.equalTo(mainTabBarView.addButton)
            make.height.width.equalTo(mainTabBarView.addButton)
            make.left.equalToSuperview().offset(self.view.frame.width/8.1)
        }
        
        mainTabBarView.myClassInquiryButton.snp.makeConstraints { make in
            make.centerY.equalTo(mainTabBarView.addButton)
            make.height.width.equalTo(mainTabBarView.addButton)
            make.right.equalToSuperview().offset(-self.view.frame.width/8.1)
        }
        
        // MARK: - lineView gradient
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 2))
        let gradient = CAGradientLayer()

        gradient.frame = view.bounds
        gradient.colors = [UIColor(red: 104/255, green: 134/255, blue: 197/255, alpha: 1).cgColor, UIColor(red: 255/255, green: 173/255, blue: 172/255, alpha: 1).cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)

        mainTabBarView.lineView.layer.insertSublayer(gradient, at: 0)
        
    }
    
}

//MARK: - Preview
#if DEBUG
import SwiftUI
struct InquiryByGradeViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        InquiryByGradeViewController()
    }
}
@available(iOS 13.0, *)
struct InquiryByGradeViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            InquiryByGradeViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif
