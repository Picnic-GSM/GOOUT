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

class InquiryByGradeViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
    
    lazy var outLabel = UILabel().then {
        $0.text = "외출"
        $0.dynamicFont(fontSize: 20, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    lazy var ingContainer = StateExplainView()
    
    lazy var timeOutContainer = StateExplainView().then {
        $0.stateColorView.backgroundColor = .rgb(red: 255, green: 107, blue: 107)
        $0.stateLabel.text = "시간초과"
    }
    
    lazy var endContainer = StateExplainView().then {
        $0.stateColorView.backgroundColor = .rgb(red: 156, green: 198, blue: 160)
        $0.stateLabel.text = "귀가완료"
    }
    
    lazy var doNotGoView = AnyStudentDoNotGoView()
    
    lazy var outTableView = UITableView().then {
        $0.showsVerticalScrollIndicator = false
        $0.separatorStyle = .none
    }
    
    lazy var outCellViewColorList: [UIColor] = [UIColor.rgb(red: 255, green: 255, blue: 255), UIColor.rgb(red: 243, green: 247, blue: 255), UIColor.rgb(red: 255, green: 255, blue: 255), UIColor.rgb(red: 243, green: 247, blue: 255), UIColor.rgb(red: 255, green: 255, blue: 255), UIColor.rgb(red: 243, green: 247, blue: 255)]
    
    lazy var outStateColorList: [UIColor] = [UIColor.rgb(red: 255, green: 205, blue: 107), UIColor.rgb(red: 255, green: 107, blue: 107), UIColor.rgb(red: 156, green: 198, blue: 160), UIColor.rgb(red: 156, green: 198, blue: 160),  UIColor.rgb(red: 156, green: 198, blue: 160), UIColor.rgb(red: 156, green: 198, blue: 160)]
    
    lazy var outNameList: [String] = ["오주연", "김소담", "변웅섭", "변웅섭", "변웅섭", "변웅섭"]
    
    lazy var outGradeClassNumList: [String] = ["2학년 1반 11번", "2학년 1반 1번", "3학년 1반 7번", "3학년 1반 7번", "3학년 1반 7번", "3학년 1반 7번"]
    
    lazy var outTimeList: [String] = ["16:30 - 18:00", "16:30 - 18:00", "16:30 - 18:00", "16:30 - 18:00", "16:30 - 18:00", "16:30 - 18:00"]
    
    lazy var outReasonList: [String] = ["생필품", "밥먹음", "준비물", "준비물", "준비물", "준비물"]
    
    lazy var earlyLeaveLabel = UILabel().then {
        $0.text = "조퇴"
        $0.dynamicFont(fontSize: 20, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    lazy var earlyLeaveTableView = UITableView().then {
        $0.showsVerticalScrollIndicator = false
        $0.separatorStyle = .none
    }
    
    lazy var earlyLeaveCellViewColorList: [UIColor] = [UIColor.rgb(red: 255, green: 255, blue: 255), UIColor.rgb(red: 255, green: 243, blue: 243), UIColor.rgb(red: 255, green: 255, blue: 255), UIColor.rgb(red: 255, green: 243, blue: 243), UIColor.rgb(red: 255, green: 255, blue: 255), UIColor.rgb(red: 255, green: 243, blue: 243)]
    
    lazy var earlyLeaveNameList: [String] = ["변웅섭", "변웅섭", "변웅섭", "변웅섭", "변웅섭", "변웅섭"]
    
    lazy var earlyLeaveGradeClassNumList: [String] = ["3학년 1반 7번", "3학년 1반 7번", "3학년 1반 7번", "3학년 1반 7번", "3학년 1반 7번", "3학년 1반 7번"]
    
    lazy var earlyLeaveReasonList: [String] = ["코로나 의심 증상", "코로나 의심 증상", "코로나 의심 증상", "코로나 의심 증상", "코로나 의심 증상", "코로나 의심 증상"]
    
    lazy var outListHeader = OutListHeaderView().then {
        $0.backgroundColor = .rgb(red: 243, green: 247, blue: 255)
    }
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - tableView
    
    func tableViewSetting(){
        outTableView.dataSource = self
        outTableView.delegate = self
                
        outTableView.register(OutListTableCell.self, forCellReuseIdentifier: OutListTableCell.OutListTableIdentifier)
        
        earlyLeaveTableView.dataSource = self
        earlyLeaveTableView.delegate = self
                
        earlyLeaveTableView.register(EarlyLeaveListTableCell.self, forCellReuseIdentifier: EarlyLeaveListTableCell.EarlyLeaveListTableIdentifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == outTableView {
            return outNameList.count
        } else {
            return earlyLeaveNameList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == outTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "OutListTableCell") as! OutListTableCell
            cell.cellView.backgroundColor = outCellViewColorList[indexPath.row]
            cell.stateColorView.backgroundColor = outStateColorList[indexPath.row]
            cell.nameLabel.text = outNameList[indexPath.row]
            cell.gradeClassNumLabel.text = outGradeClassNumList[indexPath.row]
            cell.timeLabel.text = outTimeList[indexPath.row]
            cell.reasonLabel.text = outReasonList[indexPath.row]
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EarlyLeaveListTableCell") as! EarlyLeaveListTableCell
            cell.cellView.backgroundColor = earlyLeaveCellViewColorList[indexPath.row]
            cell.nameLabel.text = earlyLeaveNameList[indexPath.row]
            cell.gradeClassNumLabel.text = earlyLeaveGradeClassNumList[indexPath.row]
            cell.reasonLabel.text = earlyLeaveReasonList[indexPath.row]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height/25.375
    }
        
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    //MARK: - Helpers
    func configureUI(){
        view.backgroundColor = .white
        
        layoutSetting()
        
        mainTabBarViewSetting()
        stateViewSetting()
        doNotGoViewSetting()
        tableViewSetting()
        headerViewSetting()
        
        doNotGoView.isHidden = true
        
        addView()
        cornerRadius()
        location()
    }
    
    func addView(){
        view.addSubview(dropLabelBtn)
        view.addSubview(gradeLabel)
        view.addSubview(downBtn)
        view.addSubview(outLabel)
        view.addSubview(ingContainer)
        view.addSubview(timeOutContainer)
        view.addSubview(endContainer)
        view.addSubview(doNotGoView)
        view.addSubview(earlyLeaveLabel)
        view.addSubview(outTableView)
        view.addSubview(earlyLeaveTableView)
        view.addSubview(outListHeader)
    }
    
    func cornerRadius(){
        ingContainer.stateColorView.layer.cornerRadius = self.view.frame.width/107.14
        timeOutContainer.stateColorView.layer.cornerRadius = self.view.frame.width/107.14
        endContainer.stateColorView.layer.cornerRadius = self.view.frame.width/107.14
        
        outListHeader.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        outListHeader.layer.cornerRadius = self.view.frame.width/37.5
        outListHeader.clipsToBounds = true
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
        
        outLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/5.72)
            make.left.equalTo(dropLabelBtn)
        }
        
        ingContainer.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/5.11)
            make.left.equalToSuperview().offset(self.view.frame.width/1.88)
            make.width.equalToSuperview().dividedBy(8.72)
            make.height.equalToSuperview().dividedBy(67.67)
        }
        
        timeOutContainer.snp.makeConstraints { make in
            make.top.equalTo(ingContainer)
            make.left.equalTo(ingContainer.snp.right).offset(self.view.frame.width/46.88)
            make.width.equalToSuperview().dividedBy(7.81)
            make.height.equalTo(ingContainer)
        }
        
        endContainer.snp.makeConstraints { make in
            make.top.equalTo(ingContainer)
            make.left.equalTo(timeOutContainer.snp.right).offset(self.view.frame.width/46.88)
            make.width.equalToSuperview().dividedBy(7.81)
            make.height.equalTo(ingContainer)
        }
        
        doNotGoView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        outTableView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/16.30)
            make.top.equalTo(outListHeader.snp.bottom)
            make.width.equalToSuperview()
            make.height.equalTo((self.view.frame.height/25.375) * CGFloat(outNameList.count))
        }
        
        earlyLeaveLabel.snp.makeConstraints { make in
            make.left.equalTo(outLabel)
            make.top.equalTo(outTableView.snp.bottom).offset(self.view.frame.height/25.37)
        }
        
        earlyLeaveTableView.snp.makeConstraints { make in
            make.left.equalTo(outTableView)
            make.top.equalTo(earlyLeaveLabel.snp.bottom)
            make.width.equalToSuperview()
            make.height.equalTo((self.view.frame.height/25.375) * CGFloat(earlyLeaveNameList.count))
        }
        
        outListHeader.snp.makeConstraints { make in
            make.left.equalTo(outTableView)
            make.top.equalTo(outLabel.snp.bottom).offset(self.view.frame.height/73.82)
            make.width.equalToSuperview().dividedBy(1.14)
            make.height.equalToSuperview().dividedBy(25.375)
        }
    }
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
    
    func headerViewSetting(){
        outListHeader.addSubview(outListHeader.nameLabel)
        outListHeader.addSubview(outListHeader.gradeClassNumLabel)
        outListHeader.addSubview(outListHeader.timeLabel)
        outListHeader.addSubview(outListHeader.reasonLabel)
        
        outListHeader.HeaderViewSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
        
        
    }
    
    // MARK: - StateExplainViewSetting
    func stateViewSetting(){
        ingContainer.addSubview(ingContainer.stateColorView)
        ingContainer.addSubview(ingContainer.stateLabel)
        
        ingContainer.stateViewSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
        
        timeOutContainer.addSubview(timeOutContainer.stateColorView)
        timeOutContainer.addSubview(timeOutContainer.stateLabel)
        
        timeOutContainer.stateViewSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
        
        endContainer.addSubview(endContainer.stateColorView)
        endContainer.addSubview(endContainer.stateLabel)
        
        endContainer.stateViewSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
    }
    
    // MARK: - AnyStudentDoNotGoViewSetting
    func doNotGoViewSetting(){
        doNotGoView.addSubview(doNotGoView.notGoImage)
        doNotGoView.addSubview(doNotGoView.noStudentLabel)
        
        doNotGoView.doNotGoViewSetting(screenHeight: self.view.frame.height)
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
