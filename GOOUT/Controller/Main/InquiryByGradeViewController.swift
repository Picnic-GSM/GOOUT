//
//  ViewController.swift
//  GOOUT
//
//  Created by 김유진 on 2021/08/27.
//

import UIKit
import Then
import Firebase
import SnapKit
import DropDown

class InquiryByGradeViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Properties
    var curGrand = 0
    
    var outGradeOne: [gradeModel] = []
    var outGradeTwo: [gradeModel] = []
    
    lazy var dropLabelBtn = UIButton().then {
        $0.backgroundColor = .white
        $0.addTarget(self, action: #selector(showGradeDropDown), for: .touchUpInside)
    }

    lazy var gradeLabel = UILabel().then {
        $0.text = "3rd Grade"
        $0.dynamicFont(fontSize: 25, currentFontName: "FugazOne-Regular")
        $0.textColor = .rgb(red: 104, green: 134, blue: 197)
    }
    
    lazy var downBtn = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "GOOUT_GradeUnderButtonImage"), for: .normal)
        $0.addTarget(self, action: #selector(showGradeDropDown), for: .touchUpInside)
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
        $0.selectionAction = { [unowned self] (index: Int, item: String) in
            gradeLabel.text = item
            self.curGrand = index+1
            fetchGradeOne()
            fetchGradeTwo()
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

    lazy var earlyLeaveLabel = UILabel().then {
        $0.text = "조퇴"
        $0.dynamicFont(fontSize: 20, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    lazy var earlyLeaveTableView = UITableView().then {
        $0.showsVerticalScrollIndicator = false
        $0.separatorStyle = .none
    }
    
    lazy var earlyLeaveCellViewColorList: [UIColor] = [UIColor.rgb(red: 255, green: 255, blue: 255), UIColor.rgb(red: 255, green: 243, blue: 243), UIColor.rgb(red: 255, green: 255, blue: 255), UIColor.rgb(red: 255, green: 243, blue: 243), UIColor.rgb(red: 255, green: 255, blue: 255), UIColor.rgb(red: 255, green: 243, blue: 243)]
    
//    lazy var earlyLeaveNameList: [String] = ["변웅섭", "변웅섭", "변웅섭", "변웅섭", "변웅섭", "변웅섭"]
//
//    lazy var earlyLeaveGradeClassNumList: [String] = ["3학년 1반 7번", "3학년 1반 7번", "3학년 1반 7번", "3학년 1반 7번", "3학년 1반 7번", "3학년 1반 7번"]
//
//    lazy var earlyLeaveReasonList: [String] = ["코로나 의심 증상", "코로나 의심 증상", "코로나 의심 증상", "코로나 의심 증상", "코로나 의심 증상", "코로나 의심 증상"]
    
    lazy var outListHeader = OutListHeaderView().then {
        $0.backgroundColor = .rgb(red: 243, green: 247, blue: 255)
    }
    
    lazy var earlyLeaveListHeader = EarlyLeaveListHeaderView().then {
        $0.backgroundColor = .rgb(red: 255, green: 243, blue: 243)
    }
    
//    var goOutInfoView = GooutEarlyLeaveInfoView()
//
//    var earlyLeaveInfoView = GooutEarlyLeaveInfoView()
    let gooutEarlyLeaveInfoView = GooutEarlyLeaceInfoAlertView().then{
        $0.alpha = 0
    }
        
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchGradeOne()
        fetchGradeTwo()
    }
    
    //MARK: - Helpers
    func configureUI(){
        view.backgroundColor = .white
        
        stateViewSetting()
        doNotGoViewSetting()
        tableViewSetting()
        headerViewSetting()
        tableViewScrollSetting()
        
        doNotGoView.isHidden = true
//        goOutInfoView.isHidden = true
//        earlyLeaveInfoView.isHidden = true
        
        addView()
        cornerRadius()
        location()
        
    }
    
    func addView(){
        view.addSubview(dropLabelBtn)
        view.addSubview(gradeLabel)
        view.addSubview(downBtn)
        view.addSubview(doNotGoView)
        view.addSubview(outLabel)
        view.addSubview(ingContainer)
        view.addSubview(timeOutContainer)
        view.addSubview(endContainer)
        view.addSubview(outListHeader)
        view.addSubview(outTableView)
        view.addSubview(earlyLeaveLabel)
        view.addSubview(earlyLeaveListHeader)
        view.addSubview(earlyLeaveTableView)
//        view.addSubview(goOutInfoView)
//        view.addSubview(earlyLeaveInfoView)
        view.addSubview(gooutEarlyLeaveInfoView)
    }
    
    func cornerRadius(){
        ingContainer.stateColorView.layer.cornerRadius = self.view.frame.width/107.14
        timeOutContainer.stateColorView.layer.cornerRadius = self.view.frame.width/107.14
        endContainer.stateColorView.layer.cornerRadius = self.view.frame.width/107.14
        
        outListHeader.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        outListHeader.layer.cornerRadius = self.view.frame.width/37.5
        outListHeader.clipsToBounds = true
        
        earlyLeaveListHeader.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        earlyLeaveListHeader.layer.cornerRadius = self.view.frame.width/37.5
        earlyLeaveListHeader.clipsToBounds = true
    }
    
    func fetchGradeOne(){
        let db = Firestore.firestore()
        
        db.collection("goout").whereField("access", isEqualTo: true).whereField("kind", isEqualTo: "외출").whereField("grade", isEqualTo: curGrand).addSnapshotListener { snapshot, err in
            self.outGradeOne = []
            if let err = err {
                print(err.localizedDescription)
                return
            }
            
            snapshot?.documents.forEach({ document in
                let gr1 = gradeModel(dict: document.data())
                self.outGradeOne.append(gr1)
            })
            self.outTableView.reloadData()
        }
    }
    
    func fetchGradeTwo(){
        let db = Firestore.firestore()
        db.collection("goout").whereField("access", isEqualTo: true).whereField("kind", isEqualTo: "조퇴").whereField("grade", isEqualTo: curGrand).addSnapshotListener { snapshot, err in
            self.outGradeTwo = []
            if let err = err {
                print(err.localizedDescription)
                return
            }
            
            snapshot?.documents.forEach({ document in
                let gr1 = gradeModel(dict: document.data())
                self.outGradeTwo.append(gr1)
            })
            print(self.outGradeTwo)
            self.earlyLeaveTableView.reloadData()
        }
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
//            make.height.equalTo((self.view.frame.height/23.2) * CGFloat(outNameList.count))
            make.height.equalTo((self.view.frame.height/23.2) * 6)
        }
        
        earlyLeaveLabel.snp.makeConstraints { make in
            make.left.equalTo(outLabel)
            make.top.equalTo(outTableView.snp.bottom).offset(self.view.frame.height/30)
        }
        
        earlyLeaveTableView.snp.makeConstraints { make in
            make.left.equalTo(outTableView)
            make.top.equalTo(earlyLeaveListHeader.snp.bottom)
            make.width.equalToSuperview()
//            make.height.equalTo((self.view.frame.height/23.2) * CGFloat(earlyLeaveNameList.count))
            make.height.equalTo((self.view.frame.height/23.2) * 6)
        }
        
        outListHeader.snp.makeConstraints { make in
            make.left.equalTo(outTableView)
            make.top.equalTo(outLabel.snp.bottom).offset(self.view.frame.height/70)
            make.width.equalToSuperview().dividedBy(1.14)
            make.height.equalToSuperview().dividedBy(23.2)
        }
        
        earlyLeaveListHeader.snp.makeConstraints { make in
            make.left.equalTo(earlyLeaveTableView)
            make.top.equalTo(earlyLeaveLabel.snp.bottom).offset(self.view.frame.height/70)
            make.width.equalToSuperview().dividedBy(1.14)
            make.height.equalToSuperview().dividedBy(23.2)
        }
    }
    
    // MARK: - InfoViewSetting
    
//    func goOutInfoViewSetting(){
//        goOutInfoView.kindLabel.text = "외출 상세"
//        goOutInfoView.closeButton.addTarget(self, action: #selector(goOutInfoViewHide), for: .touchUpInside)
//        goOutInfoView.isHidden = false
//        earlyLeaveInfoView.isHidden = true
//
//        goOutInfoView.snp.makeConstraints { make in
//            make.centerX.centerY.equalToSuperview()
//            make.width.equalToSuperview().dividedBy(1.12)
//            make.height.equalToSuperview().dividedBy(3.5)
//        }
//
//        goOutInfoView.kindShowView.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.width.equalToSuperview().dividedBy(7)
//            make.height.equalToSuperview().dividedBy(10)
//            make.top.equalToSuperview().offset(self.view.frame.height/54.13)
//        }
//
//        goOutInfoView.circleView.snp.makeConstraints { make in
//            make.centerY.equalToSuperview()
//            make.left.equalToSuperview()
//            make.height.width.equalTo(8)
//
//            goOutInfoView.circleView.layer.cornerRadius = 4
//        }
//
//        goOutInfoView.kindLabel.snp.makeConstraints { make in
//            make.right.equalToSuperview()
//            make.centerY.equalToSuperview()
//        }
//
//        goOutInfoView.nameLabel.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalTo(goOutInfoView.kindShowView.snp.bottom).offset(self.view.frame.height/54.13)
//        }
//
//        goOutInfoView.numberLabel.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalTo(goOutInfoView.nameLabel.snp.bottom).offset(self.view.frame.height/116)
//        }
//
//        goOutInfoView.timeLabelButton.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalTo(goOutInfoView.numberLabel.snp.bottom).offset(self.view.frame.height/81.2)
//            make.height.equalToSuperview().dividedBy(6.93)
//            make.width.equalToSuperview().dividedBy(2.48)
//        }
//
//        goOutInfoView.reasonTextView.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalTo(goOutInfoView.timeLabelButton.snp.bottom).offset(self.view.frame.height/62.46)
//            make.width.equalToSuperview().dividedBy(1.28)
//            make.height.equalToSuperview().dividedBy(4.95)
//        }
//
//        goOutInfoView.closeButton.snp.makeConstraints { make in
//            make.centerY.equalTo(goOutInfoView.kindShowView)
//            make.right.equalToSuperview().offset(-self.view.frame.height/54.13)
//            make.height.width.equalTo(25)
//        }
//
//        goOutInfoView.reasonTextView.showsVerticalScrollIndicator = false
//
//    }
//
//    func earlyLeaveInfoViewSetting(){
//        earlyLeaveInfoView.circleView.backgroundColor = .rgb(red: 255, green: 107, blue: 107)
//        earlyLeaveInfoView.kindLabel.text = "조퇴 상세"
//        earlyLeaveInfoView.closeButton.setImage(UIImage(named: "GOOUT_Cancel"), for: .normal)
//        earlyLeaveInfoView.closeButton.addTarget(self, action: #selector(earlyLeaveInfoViewHide), for: .touchUpInside)
//        earlyLeaveInfoView.timeLabelButton.backgroundColor = .rgb(red: 255, green: 243, blue: 243)
//        earlyLeaveInfoView.timeLabelButton.setTitleColor(.rgb(red: 255, green: 107, blue: 107), for: .normal)
//        earlyLeaveInfoView.isHidden = false
//        goOutInfoView.isHidden = true
//
//        earlyLeaveInfoView.snp.makeConstraints { make in
//            make.centerX.centerY.equalToSuperview()
//            make.width.equalToSuperview().dividedBy(1.12)
//            make.height.equalToSuperview().dividedBy(3.5)
//        }
//
//        earlyLeaveInfoView.kindShowView.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.width.equalToSuperview().dividedBy(7)
//            make.height.equalToSuperview().dividedBy(10)
//            make.top.equalToSuperview().offset(self.view.frame.height/54.13)
//        }
//
//        earlyLeaveInfoView.circleView.snp.makeConstraints { make in
//            make.centerY.equalToSuperview()
//            make.left.equalToSuperview()
//            make.height.width.equalTo(8)
//
//            earlyLeaveInfoView.circleView.layer.cornerRadius = 4
//        }
//
//        earlyLeaveInfoView.kindLabel.snp.makeConstraints { make in
//            make.right.equalToSuperview()
//            make.centerY.equalToSuperview()
//        }
//
//        earlyLeaveInfoView.nameLabel.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalTo(earlyLeaveInfoView.kindShowView.snp.bottom).offset(self.view.frame.height/54.13)
//        }
//
//        earlyLeaveInfoView.numberLabel.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalTo(earlyLeaveInfoView.nameLabel.snp.bottom).offset(self.view.frame.height/116)
//        }
//
//        earlyLeaveInfoView.timeLabelButton.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalTo(earlyLeaveInfoView.numberLabel.snp.bottom).offset(self.view.frame.height/81.2)
//            make.height.equalToSuperview().dividedBy(6.93)
//            make.width.equalToSuperview().dividedBy(2.48)
//        }
//
//        earlyLeaveInfoView.reasonTextView.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalTo(earlyLeaveInfoView.timeLabelButton.snp.bottom).offset(self.view.frame.height/62.46)
//            make.width.equalToSuperview().dividedBy(1.28)
//            make.height.equalToSuperview().dividedBy(4.95)
//        }
//
//        earlyLeaveInfoView.closeButton.snp.makeConstraints { make in
//            make.centerY.equalTo(earlyLeaveInfoView.kindShowView)
//            make.right.equalToSuperview().offset(-self.view.frame.height/54.13)
//            make.height.width.equalTo(25)
//        }
//
//        earlyLeaveInfoView.reasonTextView.showsVerticalScrollIndicator = false
//    }

    // MARK: - tableView
    
    func tableViewSetting(){
        outTableView.dataSource = self
        outTableView.delegate = self
                
        outTableView.register(OutListTableCell.self, forCellReuseIdentifier: OutListTableCell.OutListTableIdentifier)
        
        earlyLeaveTableView.dataSource = self
        earlyLeaveTableView.delegate = self
                
        earlyLeaveTableView.register(EarlyLeaveListTableCell.self, forCellReuseIdentifier: EarlyLeaveListTableCell.EarlyLeaveListTableIdentifier)
    }
    
    func tableViewScrollSetting(){
        if outGradeOne.count <= 6 {
            outTableView.isScrollEnabled = false
        } else {
            outTableView.isScrollEnabled = true
        }
        
        if outGradeTwo.count <= 6 {
            earlyLeaveTableView.isScrollEnabled = false
        } else {
            earlyLeaveTableView.isScrollEnabled = true
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == outTableView {
            return outGradeOne.count
        } else {
            return outGradeTwo.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == outTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "OutListTableCell") as! OutListTableCell
            cell.cellView.backgroundColor = outCellViewColorList[indexPath.row]
            cell.stateColorView.backgroundColor = outStateColorList[indexPath.row]
            cell.nameLabel.text = outGradeOne[indexPath.row].name
            cell.gradeClassNumLabel.text = outGradeOne[indexPath.row].classNumber
            cell.timeLabel.text = "\(outGradeOne[indexPath.row].startTime) - \(outGradeOne[indexPath.row].endTime)"
            cell.reasonLabel.text = outGradeOne[indexPath.row].reason
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EarlyLeaveListTableCell") as! EarlyLeaveListTableCell
            cell.cellView.backgroundColor = earlyLeaveCellViewColorList[indexPath.row]
            cell.nameLabel.text = outGradeTwo[indexPath.row].name
            cell.gradeClassNumLabel.text = outGradeTwo[indexPath.row].classNumber
            cell.reasonLabel.text = outGradeTwo[indexPath.row].reason
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height/23.2
    }
        
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == outTableView {
            gooutEarlyLeaveInfoView.nameLabel.text = outGradeOne[indexPath.row].name
            gooutEarlyLeaveInfoView.numberLabel.text = outGradeOne[indexPath.row].classNumber
            gooutEarlyLeaveInfoView.timeLabelButton.time.text = "\(outGradeOne[indexPath.row].startTime) - \(outGradeOne[indexPath.row].endTime)"
            gooutEarlyLeaveInfoView.reasonTextView.text = outGradeOne[indexPath.row].reason
            gooutEarlyLeaveInfoView.alpha = 1
        } else {
            gooutEarlyLeaveInfoView.nameLabel.text = outGradeTwo[indexPath.row].name
            gooutEarlyLeaveInfoView.numberLabel.text = outGradeTwo[indexPath.row].classNumber
            gooutEarlyLeaveInfoView.timeLabelButton.time.text = "조퇴"
            gooutEarlyLeaveInfoView.reasonTextView.text = outGradeTwo[indexPath.row].reason
            gooutEarlyLeaveInfoView.alpha = 1
        }
    }
    
    func headerViewSetting(){
        outListHeader.addSubview(outListHeader.nameLabel)
        outListHeader.addSubview(outListHeader.gradeClassNumLabel)
        outListHeader.addSubview(outListHeader.timeLabel)
        outListHeader.addSubview(outListHeader.reasonLabel)
        
        outListHeader.HeaderViewSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
        
        earlyLeaveListHeader.addSubview(earlyLeaveListHeader.nameLabel)
        earlyLeaveListHeader.addSubview(earlyLeaveListHeader.gradeClassNumLabel)
        earlyLeaveListHeader.addSubview(earlyLeaveListHeader.reasonLabel)
        
        earlyLeaveListHeader.HeaderViewSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
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
        
        showdoNotGoView()
    }
    
    func showdoNotGoView(){
        if outGradeOne.count == 0 && outGradeTwo.count == 0{
            doNotGoView.isHidden = false
        }
    }
    
    // MARK: - Selector
    @objc
    func showGradeDropDown(_ sender : UIButton) {
        gradeDropDown.show()
    }
    
}
//
////MARK: - Preview
//#if DEBUG
//import SwiftUI
//struct InquiryByGradeViewControllerRepresentable: UIViewControllerRepresentable {
//
//func updateUIViewController(_ uiView: UIViewController,context: Context) {
//        // leave this empty
//}
//    @available(iOS 13.0.0, *)
//    func makeUIViewController(context: Context) -> UIViewController{
//        InquiryByGradeViewController()
//    }
//}
//@available(iOS 13.0, *)
//struct InquiryByGradeViewControllerRepresentable_PreviewProvider: PreviewProvider {
//    static var previews: some View {
//        Group {
//            InquiryByGradeViewControllerRepresentable()
//                .ignoresSafeArea()
//                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
//                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
//        }
//
//    }
//} #endif
