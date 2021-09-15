//
//  InquiryForEachClassViewController.swift
//  GOOUT
//
//  Created by Ji-hoon Ahn on 2021/08/31.
//

import UIKit
import SnapKit
import Then

class InquiryForEachClassViewController : UIViewController{
    //MARK: - Properties
    private var requestConfirmationData : [GoingOutEarlyLeaveCellModel] = []

    private var pleaseCheckYourReturnHomeTableData : [FinishedGoingHome] = []
        
    let bounds: CGRect = UIScreen.main.bounds
    
    private let eachClassTitle = UILabel().then{
        $0.textColor = UIColor.rgb(red: 104, green: 134, blue: 197)
        $0.text = "2-1"
        $0.dynamicFont(fontSize: 25, currentFontName: "FugazOne-Regular")
    }
    private let requestConfirmationLabel = UILabel().then{
        $0.text = "외출, 조퇴 요청을 확인해주세요!"
        $0.textColor = .black
        $0.dynamicFont(fontSize: 20, currentFontName: "AppleSDGothicNeo-Thin")
    }
    fileprivate let requestConfirmationCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(requestConfirmationCell.self, forCellWithReuseIdentifier: requestConfirmationCell.identifier)
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    private let comeBackCheck = UILabel().then{
        $0.textColor = .black
        $0.text = "귀가를 확인해주세요!"
        $0.dynamicFont(fontSize: 20, currentFontName: "AppleSDGothicNeo-Thin")
    }
    private let statusView = OutConditionView()
    fileprivate let homeComingTableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false

        tableView.register(PleaseCheckYourReturnHomeTableCell.self, forCellReuseIdentifier: PleaseCheckYourReturnHomeTableCell.identifier)
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorColor = UIColor.clear
        tableView.backgroundColor = .clear
        tableView.alpha = 1
        return tableView
    }()
    
    private let noHistory : noHistoryView = {
        let view = noHistoryView()
        view.alpha = 0
        return view
    }()

    let gooutEarlyLeaveInfoView = GooutEarlyLeaveInfoView()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        homeComingTableView.tableFooterView = UIView()
        requestConfirmationCollectionView.contentInset = UIEdgeInsets(top: 0, left: bounds.height/35.30434782, bottom: 0, right: bounds.height/35.30434782)
        homeComingTableView.automaticallyAdjustsScrollIndicatorInsets = false
        

    }
    
    func gooutEarlyLeaveInfoViewSetting(){
        gooutEarlyLeaveInfoViewSetting()
        self.view.addSubview(gooutEarlyLeaveInfoView)
        
        gooutEarlyLeaveInfoView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.12)
            make.height.equalToSuperview().dividedBy(3.9)
        }
        
        gooutEarlyLeaveInfoView.kindShowView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(7)
            make.height.equalToSuperview().dividedBy(10)
            make.top.equalToSuperview().offset(self.view.frame.height/54.13)
        }
        
        gooutEarlyLeaveInfoView.circleView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview()
            make.height.width.equalTo(8)
            
            gooutEarlyLeaveInfoView.circleView.layer.cornerRadius = 4
        }
        
        gooutEarlyLeaveInfoView.kindLabel.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        gooutEarlyLeaveInfoView.nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(gooutEarlyLeaveInfoView.kindShowView.snp.bottom).offset(self.view.frame.height/54.13)
        }
        
        gooutEarlyLeaveInfoView.numberLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(gooutEarlyLeaveInfoView.nameLabel.snp.bottom).offset(self.view.frame.height/116)
        }
        
        gooutEarlyLeaveInfoView.timeLabelButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(gooutEarlyLeaveInfoView.numberLabel.snp.bottom).offset(self.view.frame.height/81.2)
            make.height.equalToSuperview().dividedBy(6.93)
            make.width.equalToSuperview().dividedBy(2.48)
        }
        
        gooutEarlyLeaveInfoView.reasonTextView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(gooutEarlyLeaveInfoView.timeLabelButton.snp.bottom).offset(self.view.frame.height/62.46)
            make.width.equalToSuperview().dividedBy(1.28)
            make.height.equalToSuperview().dividedBy(4.95)
        }
        
        gooutEarlyLeaveInfoView.closeButton.snp.makeConstraints { make in
            make.centerY.equalTo(gooutEarlyLeaveInfoView.kindShowView)
            make.right.equalToSuperview().offset(-self.view.frame.height/54.13)
            make.height.width.equalTo(25)
        }
        
        gooutEarlyLeaveInfoView.reasonTextView.showsVerticalScrollIndicator = false
        
    }
    
    //MARK: - Selectors


    //MARK:- DeleteCollectionView
    @objc func CloseCollectionViewItem(sender:UIButton){
        requestConfirmationCollectionView.deleteItems(at: [IndexPath.init(row: sender.tag, section: 0)])
        requestConfirmationData.remove(at: sender.tag)
    }
    @objc func SaveAndCloseCollectionViewItem(sender:UIButton){
        requestConfirmationCollectionView.deleteItems(at: [IndexPath.init(row: sender.tag, section: 0)])
        requestConfirmationData.remove(at: sender.tag)
    }
    //MARK: - Helper
    func configureUI(){
        view.backgroundColor = .white
        addView()
        AddrequestConfirmationData()
        AddPleaseCheckYourReturnHomeTableData()
        location()
        CollectionViewAndTableViewSetting()
        

    }
    //MARK:-DataSource & Delegate
    func CollectionViewAndTableViewSetting(){
        requestConfirmationCollectionView.delegate = self
        requestConfirmationCollectionView.dataSource = self
        homeComingTableView.delegate = self
        homeComingTableView.dataSource = self
    }
    //MARK:-addView
    func addView(){
        view.addSubview(eachClassTitle)
        view.addSubview(requestConfirmationLabel)
        view.addSubview(requestConfirmationCollectionView)
        view.addSubview(comeBackCheck)
        view.addSubview(statusView)
        view.addSubview(homeComingTableView)
        view.addSubview(noHistory)
    }
    //MARK:-Location
    func location(){
        eachClassTitle.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(bounds.height/11.4366)
            make.left.equalToSuperview().offset(bounds.height/24.6)
        }
        requestConfirmationLabel.snp.makeConstraints { (make) in
            make.top.equalTo(eachClassTitle.snp.bottom).offset(bounds.height/23.882)
            make.left.equalToSuperview().offset(bounds.height/28)
      
        }
        requestConfirmationCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(requestConfirmationLabel.snp.bottom).offset(bounds.height/62.4615)
            make.width.equalToSuperview()
            make.height.equalTo(bounds.height/5.13924)
        }
        comeBackCheck.snp.makeConstraints { (make) in
            make.top.equalTo(requestConfirmationCollectionView.snp.bottom).offset(bounds.height/21.945945)
            make.left.equalToSuperview().offset(bounds.height/31.23076)
        }
        statusView.snp.makeConstraints { (make) in
            make.centerY.equalTo(comeBackCheck.snp.centerY)
            make.right.equalToSuperview()
            make.left.equalTo(comeBackCheck.snp.right).offset(view.frame.width/53.5714)
            make.height.equalTo(bounds.height/67.66667)
        }
        homeComingTableView.snp.makeConstraints { (make) in
            make.top.equalTo(comeBackCheck.snp.bottom).offset(bounds.height/90.2222)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().inset(bounds.height/21.36)
        }
        noHistory.snp.makeConstraints { (make) in
            make.width.equalTo(view.frame.width/1.27986)
            make.height.equalTo(view.frame.height/3.184314)
            make.centerX.equalToSuperview()
            make.top.equalTo(comeBackCheck).offset(view.frame.height/11.768)

        }
        
    }
    //MARK: - CollectionView Data Add
    func AddrequestConfirmationData(){
        requestConfirmationData.append(GoingOutEarlyLeaveCellModel.init( earlyTextType: GoingOutLeavingEarlyText.goingOut, name: "안지훈", number: 2, time: receivedTime.init(startClock: time.init(oclock: 10, minute: 20), finishClock: time.init(oclock: 15, minute: 18)), reason: "마카롱"))
        requestConfirmationData.append(GoingOutEarlyLeaveCellModel.init( earlyTextType: GoingOutLeavingEarlyText.leavingEarly, name: "이시완", number: 8, time: receivedTime.init(startClock: time.init(oclock: 13, minute: 20), finishClock: time.init(oclock: nil, minute: nil)), reason: "마카롱"))
        requestConfirmationData.append(GoingOutEarlyLeaveCellModel.init( earlyTextType: GoingOutLeavingEarlyText.goingOut, name: "임준화", number: 8, time: receivedTime.init(startClock: time.init(oclock: 11, minute: 20), finishClock: time.init(oclock: 15, minute: 24)), reason: "마카롱"))
        requestConfirmationData.append(GoingOutEarlyLeaveCellModel.init( earlyTextType: GoingOutLeavingEarlyText.leavingEarly, name: "김유진", number: 8, time: receivedTime.init(startClock: time.init(oclock: 12, minute: 20), finishClock: time.init(oclock: nil, minute: nil)), reason: "마카롱"))
    }
    
    //MARK: - TableView Data add
    func AddPleaseCheckYourReturnHomeTableData(){
        pleaseCheckYourReturnHomeTableData.append(FinishedGoingHome.init(viewColor: .FinishGoingHomeColor.GOOUT_Green, name: "안지훈", number: 8, time: receivedTime.init(startClock: time.init(oclock: 10, minute: 20), finishClock: time.init(oclock: 12, minute: 10)), btnTitle: FinishedGoingHomeStatus.completeGoingHome))
        pleaseCheckYourReturnHomeTableData.append(FinishedGoingHome.init(viewColor: .FinishGoingHomeColor.GOOUT_Green, name: "이시완", number: 3, time: receivedTime.init(startClock: time.init(oclock: 10, minute: 50), finishClock: time.init(oclock: 17, minute: 10)), btnTitle: FinishedGoingHomeStatus.completeGoingHome))
        pleaseCheckYourReturnHomeTableData.append(FinishedGoingHome.init(viewColor: .FinishGoingHomeColor.GOOUT_Green, name: "임준화", number: 2, time: receivedTime.init(startClock: time.init(oclock: 10, minute: 13), finishClock: time.init(oclock: 19, minute: 10)), btnTitle: FinishedGoingHomeStatus.completeGoingHome))
        pleaseCheckYourReturnHomeTableData.append(FinishedGoingHome.init(viewColor: .FinishGoingHomeColor.GOOUT_yellow, name: "최형우", number: 10, time: receivedTime.init(startClock: time.init(oclock: 10, minute: 20), finishClock: time.init(oclock: 20, minute: 10)), btnTitle: FinishedGoingHomeStatus.completeGoingHome))
        pleaseCheckYourReturnHomeTableData.append(FinishedGoingHome.init(viewColor: .FinishGoingHomeColor.GOOUT_red, name: "진시윤", number: 18, time: receivedTime.init(startClock: time.init(oclock: 10, minute: 10), finishClock: time.init(oclock: 18, minute: 10)), btnTitle: FinishedGoingHomeStatus.completeGoingHome))
    }
}


//MARK: - CollectionView
extension InquiryForEachClassViewController : UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return requestConfirmationData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: requestConfirmationCell.identifier, for: indexPath) as! requestConfirmationCell
        //MARK: - Cell Setting
        if requestConfirmationData[indexPath.row].earlyTextType == GoingOutLeavingEarlyText.goingOut {
            cell.layer.borderColor = UIColor.rgb(red: 211, green: 222, blue: 244).cgColor
            cell.requestStatus.status.backgroundColor = UIColor.GoingOutEarlyLeave.GOOUT_blue
            cell.closeBtn.tintColor = .rgb(red: 134, green: 161, blue: 217)
            cell.earlyLeaveTimeToGoOutLabel.time.text = "\(requestConfirmationData[indexPath.row].time.startClock!.oclock!):\(requestConfirmationData[indexPath.row].time.startClock!.minute!) - \(requestConfirmationData[indexPath.row].time.finishClock!.oclock!):\(requestConfirmationData[indexPath.row].time.finishClock!.minute!)"
            cell.earlyLeaveTimeToGoOutLabel.time.textColor = .rgb(red: 104, green: 134, blue: 197)
            cell.earlyLeaveTimeToGoOutLabel.view.backgroundColor = .rgb(red: 243, green: 247, blue: 255)
            cell.btnApproval.backgroundColor = .rgb(red: 134, green: 161, blue: 217)
        }else if requestConfirmationData[indexPath.row].earlyTextType == GoingOutLeavingEarlyText.leavingEarly{
            cell.layer.borderColor = UIColor.rgb(red: 255, green: 221, blue: 221).cgColor
            cell.requestStatus.status.backgroundColor = UIColor.GoingOutEarlyLeave.GOOUT_red
            cell.earlyLeaveTimeToGoOutLabel.time.text = "\(requestConfirmationData[indexPath.row].time.startClock!.oclock!):\(requestConfirmationData[indexPath.row].time.startClock!.minute!) ~"
            cell.earlyLeaveTimeToGoOutLabel.time.textColor = .rgb(red: 243, green: 131, blue: 146)
            cell.earlyLeaveTimeToGoOutLabel.view.backgroundColor = .rgb(red: 255, green: 243, blue: 243)
            cell.closeBtn.tintColor = .rgb(red: 255, green: 172, blue: 183)
            cell.btnApproval.backgroundColor = .rgb(red: 255, green: 168, blue: 179)
        }
        cell.backgroundColor = .white
        cell.requestStatus.label.text = requestConfirmationData[indexPath.row].earlyTextType.rawValue
        cell.requestStudentName.text = requestConfirmationData[indexPath.row].name
        cell.requestStudentClass.text = "3학년 1반 \(requestConfirmationData[indexPath.row].number)번"
        //MARK:- Time
        
        
        cell.reason.text = requestConfirmationData[indexPath.row].reason
        cell.layer.borderWidth = 1
        cell.clipsToBounds = true
        cell.layer.cornerRadius = bounds.height/81.2
        cell.closeBtn.tag = indexPath.row
        cell.closeBtn.addTarget(self, action: #selector(CloseCollectionViewItem(sender:)), for: .touchUpInside)
        cell.btnApproval.tag = indexPath.row
        cell.btnApproval.addTarget(self, action: #selector(SaveAndCloseCollectionViewItem(sender:)), for: .touchUpInside)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: bounds.width/3.09917, height: bounds.height/5.139240)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return bounds.height/54.133
    }


}
//MARK:-TableView
extension InquiryForEachClassViewController : UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pleaseCheckYourReturnHomeTableData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PleaseCheckYourReturnHomeTableCell.identifier,for: indexPath) as! PleaseCheckYourReturnHomeTableCell
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        cell.attendanceButton.backgroundColor = UIColor.rgb(red: 104, green: 134, blue: 197)
        cell.selectionStyle = .none
        cell.requestStatus.backgroundColor = pleaseCheckYourReturnHomeTableData[indexPath.row].viewColor
        cell.requestStudentName.text = pleaseCheckYourReturnHomeTableData[indexPath.row].name
            cell.requestStudentClass.text = "3학년 1반 \(pleaseCheckYourReturnHomeTableData[indexPath.row].number!)반"
        //MARK:- Time
        cell.earlyLeaveTimeToGoOutLabel.time.text = "\(pleaseCheckYourReturnHomeTableData[indexPath.row].time!.startClock!.oclock!):\(pleaseCheckYourReturnHomeTableData[indexPath.row].time!.startClock!.minute!) - \(pleaseCheckYourReturnHomeTableData[indexPath.row].time!.finishClock!.oclock!):\(pleaseCheckYourReturnHomeTableData[indexPath.row].time!.finishClock!.oclock!)"
        cell.earlyLeaveTimeToGoOutLabel.time.textColor = .rgb(red: 104, green: 104, blue: 197)

        cell.attendanceButton.setTitle(pleaseCheckYourReturnHomeTableData[indexPath.row].btnTitle.rawValue, for: .normal)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return bounds.height/11.123
    }
}
