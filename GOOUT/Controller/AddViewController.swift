//
//  AddViewController.swift
//  GOOUT
//
//  Created by 김유진 on 2021/08/30.
//

import UIKit
import Then
import SnapKit
import DropDown
import QuartzCore
 
class AddViewController: UIViewController{
    // MARK: - property
    lazy var titleView = UIView().then{
        $0.backgroundColor = UIColor(red: 104/255, green: 134/255, blue: 197/255, alpha: 1)
    }
    
    lazy var titleLabel = UILabel().then{
        $0.text = "외출/조퇴 추가하기"
        $0.textColor = UIColor.white
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var whiteView = UIView().then{
        $0.backgroundColor = UIColor.white
        $0.layer.shadowColor = UIColor.lightGray.cgColor
        $0.layer.shadowOffset = CGSize(width: 0, height: 3)
        $0.layer.shadowRadius = 10
        $0.layer.shadowOpacity = 0.3
        $0.layer.cornerRadius = 15
    }
    
    lazy var gooutButton = UIButton().then{
        $0.setImage(UIImage(named: "GOOUT_SelectedCheckButtonImage"), for: .normal)
    }
    
    lazy var earlyLeaveButton = UIButton().then{
        $0.setImage(UIImage(named: "GOOUT_CheckButtonImage"), for: .normal)
    }
    
    lazy var gooutLabel = UILabel().then{
        $0.text = "외출"
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Regular")
        $0.textColor = UIColor(red: 105/255, green: 105/255, blue: 105/255, alpha: 1)
    }
    
    lazy var earlyLeaveLabel = UILabel().then{
        $0.text = "조퇴"
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Regular")
        $0.textColor = UIColor(red: 105/255, green: 105/255, blue: 105/255, alpha: 1)
    }
    
    lazy var gooutTimeLabel = UILabel().then{
        $0.text = "외출시간"
        $0.textColor = UIColor(red: 105/255, green: 105/255, blue: 105/255, alpha: 1)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    lazy var gooutStartTimeButton = UIButton().then{
        $0.layer.borderWidth = 0.6
        $0.layer.borderColor = UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1).cgColor
        $0.layer.cornerRadius = 7
    }
    
    lazy var selectedGooutStartTimeLabel = UILabel().then{
        $0.text = "1교시(08:40)"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Light")
        $0.textColor = UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1)
    }
    
    lazy var gooutStartTimeUnderButton = UIButton().then{
        $0.setImage(UIImage(named: "GOOUT_UnderButtonImage"), for: .normal)
    }
    
    lazy var gooutStartTimeDropDown = DropDown().then{
        $0.dataSource = gooutTimeArray
        $0.anchorView = gooutStartTimeButton
        $0.direction = .bottom
        $0.offsetFromWindowBottom = 120
        $0.bottomOffset = CGPoint(x: 0, y: self.view.frame.height/20)
        $0.textFont = UIFont(name: "AppleSDGothicNeo-Light", size: 10)!
        $0.backgroundColor = UIColor.white
        $0.cornerRadius = 7
        $0.cellHeight = self.view.frame.height/26
        $0.shadowColor = UIColor.lightGray
        $0.shadowOffset = CGSize(width: 0, height: 3)
        $0.shadowRadius = 10
        $0.shadowOpacity = 0.3
    }
    
    lazy var gooutEndTimeButton = UIButton().then{
        $0.layer.borderWidth = 0.6
        $0.layer.borderColor = UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1).cgColor
        $0.layer.cornerRadius = 7
    }
    
    lazy var selectedGooutEndTimeLabel = UILabel().then{
        $0.text = "2교시(09:40)"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Light")
        $0.textColor = UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1)
    }
    
    lazy var gooutEndTimeUnderButton = UIButton().then{
        $0.setImage(UIImage(named: "GOOUT_UnderButtonImage"), for: .normal)
    }
    
    lazy var gooutEndTimeDropDown = DropDown().then{
        $0.dataSource = ["2교시(09:40)","3교시(10:40)","4교시(11:40)","점심시간(12:30)","5교시(13:30)","6교시(14:30)","7교시(15:30)","8교시(16:40)","9교시(17:40)","저녁시간(18:30)","10교시(19:40)","11교시(20:40)"]
        $0.anchorView = gooutEndTimeButton
        $0.direction = .bottom
        $0.offsetFromWindowBottom = 120
        $0.bottomOffset = CGPoint(x: 0, y: self.view.frame.height/20)
        $0.textFont = UIFont(name: "AppleSDGothicNeo-Light", size: 10)!
        $0.backgroundColor = UIColor.white
        $0.cornerRadius = 7
        $0.cellHeight = self.view.frame.height/26
        $0.shadowColor = UIColor.lightGray
        $0.shadowOffset = CGSize(width: 0, height: 3)
        $0.shadowRadius = 10
        $0.shadowOpacity = 0.3
    }
    
    lazy var waveLabel = UILabel().then{
        $0.text = "ㅡ"
        $0.textColor = UIColor(red: 180/255, green: 180/255, blue: 180/255, alpha: 1)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-UltraLight")
    }
    
    lazy var reasonLabel = UILabel().then{
        $0.text = "사유"
        $0.textColor = UIColor(red: 105/255, green: 105/255, blue: 105/255, alpha: 1)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.backgroundColor = .white
    }
    
    lazy var reasonTextView = UITextView().then{
        $0.text = "사유를 입력해주세요."
        $0.textColor = UIColor.lightGray
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Light")
    }
    
    lazy var addButton = UIButton().then{
        $0.setImage(UIImage(named: "GOOUT_GooutAddButtonImage"), for: .normal)
        $0.sizeToFit()
    }
    
    var selectedLabel = "goout"
    
    var newDataSource = [String]()
    
    var gooutTimeArray = ["1교시(08:40)","2교시(09:40)","3교시(10:40)","4교시(11:40)","점심시간(12:30)","5교시(13:30)","6교시(14:30)","7교시(15:30)","8교시(16:40)","9교시(17:40)","저녁시간(18:30)","10교시(19:40)","11교시(20:40)"]
    
    var gooutEndTimeArray = ["1교시(08:40)","2교시(09:40)","3교시(10:40)","4교시(11:40)","점심시간(12:30)","5교시(13:30)","6교시(14:30)","7교시(15:30)","8교시(16:40)","9교시(17:40)","저녁시간(18:30)","10교시(19:40)","11교시(20:40)", "종례시간(21:20)"]
    
    // MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutSetting()
    }
    
    func shakeView(_ textView: UITextView?) {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 1.7
        shake.autoreverses = true
        shake.fromValue = NSValue(cgPoint: CGPoint(x: (textView?.center.x)! - 5, y: textView?.center.y ?? 0.0))
        shake.toValue = NSValue(cgPoint: CGPoint(x: (textView?.center.x)! + 5, y: textView?.center.y ?? 0.0))
        textView?.layer.add(shake, forKey: "position")
    }
    
    func gooutAnimation(flag: CGFloat){
        self.gooutTimeLabel.alpha = flag
        self.gooutStartTimeButton.alpha = flag
        self.selectedGooutStartTimeLabel.alpha = flag
        self.gooutStartTimeUnderButton.alpha = flag
        self.waveLabel.alpha = flag
        self.gooutEndTimeButton.alpha = flag
        self.selectedGooutEndTimeLabel.alpha = flag
        self.gooutEndTimeUnderButton.alpha = flag
    }
    
    @objc func gooutButtonClicked(sender:UIButton){
        if gooutButton.isSelected == true{
            gooutButton.setImage(UIImage(named: "GOOUT_SelectedCheckButtonImage"), for: .normal)
            earlyLeaveButton.setImage(UIImage(named: "GOOUT_CheckButtonImage"), for: .normal)
            earlyLeaveButton.isSelected.toggle()
            gooutButton.isSelected.toggle()
            
            UIView.animate(withDuration: 0.5) {
                self.gooutAnimation(flag: 1)
                
                self.reasonLabel.snp.remakeConstraints { make in
                    make.left.equalTo(self.gooutTimeLabel)
                    make.top.equalTo(self.gooutStartTimeButton.snp.bottom).offset(self.view.frame.height/18.04)
                }
                
                self.view.superview?.layoutIfNeeded()
            }
            
            selectedLabel = "goout"
        }
    }
    
    @objc func earlyLeaveButtonClicked(sender:UIButton){
        if earlyLeaveButton.isSelected == false{
            earlyLeaveButton.setImage(UIImage(named: "GOOUT_SelectedCheckButtonImage"), for: .normal)
            gooutButton.setImage(UIImage(named: "GOOUT_CheckButtonImage"), for: .normal)
            gooutButton.isSelected.toggle()
            earlyLeaveButton.isSelected.toggle()

            UIView.animate(withDuration: 0.5) {
//                self.gooutAnimation(flag: 0)
//                
//                self.reasonLabel.snp.remakeConstraints { make in
//                    make.left.equalTo(self.gooutTimeLabel)
//                    make.top.equalTo(self.gooutTimeLabel)
//                }
//                
//                self.view.superview?.layoutIfNeeded()
            }
            
            selectedLabel = "earlyLeave"
        }
    }
    
    @objc func gooutEndTimeButtonClicked(sender:UIButton){
        gooutEndTimeDropDown.show()
    }
    
    @objc func gooutStartTimeButtonClicked(sender:UIButton){
        gooutStartTimeDropDown.show()
    }
    
    @objc func addButtonClicked(sender:UIButton){
        if reasonTextView.text == "사유를 입력해주세요." || reasonTextView.text == ""{
            shakeView(reasonTextView)
        }else{
            dismiss(animated: true, completion: nil)
        }
        
        print(selectedLabel)
        print(reasonTextView.text as Any)
        print(selectedGooutStartTimeLabel.text as Any)
        print(selectedGooutEndTimeLabel.text as Any)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
          self.view.endEditing(true)
    }
    
    @objc func keyboardWillShow(_ sender: Notification) {
        UIView.animate(withDuration: 0.5) {
            self.addButton.snp.remakeConstraints { make in
                make.width.equalToSuperview().dividedBy(1.35)
                make.height.equalToSuperview().dividedBy(19.13)
                make.centerX.centerY.equalToSuperview()
            }
            
            self.reasonLabel.snp.remakeConstraints { make in
                make.left.equalTo(self.gooutTimeLabel)
                make.top.equalTo(self.gooutTimeLabel)
            }
            
            self.gooutTimeLabel.alpha = 0
            
            self.addButton.superview?.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillHide(_ sender: Notification) {
        UIView.animate(withDuration: 0.5) {
            self.addButton.snp.remakeConstraints { make in
                make.bottom.equalToSuperview().offset(-self.view.frame.height/10.23)
                make.width.equalToSuperview().dividedBy(1.35)
                make.height.equalToSuperview().dividedBy(19.13)
                make.centerX.equalToSuperview()
            }
            
            if self.selectedLabel == "goout"{
                self.reasonLabel.snp.remakeConstraints { make in
                    make.left.equalTo(self.gooutTimeLabel)
                    make.top.equalTo(self.gooutStartTimeButton.snp.bottom).offset(self.view.frame.height/18.04)
                }
                
                self.gooutTimeLabel.alpha = 1
            }
            
            self.addButton.superview?.layoutIfNeeded()
        }
    }
    
    // MARK: - reasonTextViewSetting
    func reasonTextViewSetting(){
        if reasonTextView.text == "사유를 입력해주세요."{
            reasonTextView.text = ""
            reasonTextView.textColor = .black
        }else if reasonTextView.text == ""{
            reasonTextView.text = "사유를 입력해주세요."
            reasonTextView.textColor = .lightGray
        }
    }
    
    // MARK: - layoutSetting
    func layoutSetting(){
        self.view.backgroundColor = .white
        self.view.addSubview(titleView)
        titleView.addSubview(titleLabel)
        self.view.addSubview(whiteView)
        whiteView.addSubview(gooutButton)
        whiteView.addSubview(earlyLeaveButton)
        whiteView.addSubview(gooutLabel)
        whiteView.addSubview(earlyLeaveLabel)
        self.view.addSubview(gooutTimeLabel)
        self.view.addSubview(gooutStartTimeButton)
        self.view.addSubview(selectedGooutStartTimeLabel)
        self.view.addSubview(gooutStartTimeUnderButton)
        self.view.addSubview(gooutStartTimeDropDown)
        self.view.addSubview(waveLabel)
        self.view.addSubview(gooutEndTimeButton)
        self.view.addSubview(gooutEndTimeDropDown)
        self.view.addSubview(gooutEndTimeUnderButton)
        self.view.addSubview(selectedGooutEndTimeLabel)
        self.view.addSubview(reasonLabel)
        self.view.addSubview(reasonTextView)
        self.view.addSubview(addButton)
        
        reasonTextView.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        gooutButton.addTarget(self, action: #selector(gooutButtonClicked(sender:)), for: .touchUpInside)
        earlyLeaveButton.addTarget(self, action: #selector(earlyLeaveButtonClicked(sender:)), for: .touchUpInside)
        gooutStartTimeButton.addTarget(self, action: #selector(gooutStartTimeButtonClicked(sender:)), for: .touchUpInside)
        gooutStartTimeUnderButton.addTarget(self, action: #selector(gooutStartTimeButtonClicked(sender:)), for: .touchUpInside)
        gooutEndTimeButton.addTarget(self, action: #selector(gooutEndTimeButtonClicked(sender:)), for: .touchUpInside)
        gooutEndTimeUnderButton.addTarget(self, action: #selector(gooutEndTimeButtonClicked(sender:)), for: .touchUpInside)
        addButton.addTarget(self, action: #selector(addButtonClicked(sender:)), for: .touchUpInside)
        
        gooutEndTimeDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            selectedGooutEndTimeLabel.text = "\(item)"
            self.gooutEndTimeDropDown.clearSelection()
        }
        
        gooutStartTimeDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            selectedGooutStartTimeLabel.text = "\(item)"
            
            newDataSource = []
            
            selectedGooutEndTimeLabel.text = gooutEndTimeArray[index+1]
            
            for i in index+1...gooutEndTimeArray.count-1{
                newDataSource.append(gooutEndTimeArray[i])
            }
            
            gooutEndTimeDropDown.dataSource = newDataSource
            self.gooutStartTimeDropDown.clearSelection()
        }
        
        titleView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(10.38)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(self.view.frame.height/200)
            make.centerX.equalToSuperview()
        }
        
        whiteView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(self.view.frame.width/7)
            make.height.equalToSuperview().dividedBy(15.14)
            make.top.equalTo(titleView.snp.bottom).offset(self.view.frame.height/12.75)
        }
        
        gooutButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/10.78)
            make.width.equalToSuperview().dividedBy(17.6)
            make.height.equalTo(gooutButton.snp.width)
            make.centerY.equalToSuperview()
        }
        
        gooutLabel.snp.makeConstraints { make in
            make.left.equalTo(gooutButton.snp.right).offset(self.view.frame.width/38.33)
            make.centerY.equalTo(gooutButton).offset(self.view.frame.height/600)
        }
        
        earlyLeaveLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-self.view.frame.width/10.79)
            make.centerY.equalToSuperview().offset(self.view.frame.height/600)
        }
        
        earlyLeaveButton.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(17.6)
            make.height.equalTo(gooutButton.snp.width)
            make.centerY.equalTo(gooutButton)
            make.right.equalTo(earlyLeaveLabel.snp.left).offset(-self.view.frame.width/38.33)
        }
        
        gooutTimeLabel.snp.makeConstraints { make in
            make.top.equalTo(whiteView.snp.bottom).offset(self.view.frame.height/16.15)
            make.left.equalTo(whiteView)
        }
        
        gooutStartTimeButton.snp.makeConstraints { make in
            make.left.equalTo(gooutTimeLabel)
            make.top.equalTo(gooutTimeLabel.snp.bottom).offset(self.view.frame.height/103.85)
            make.height.equalToSuperview().dividedBy(26.37)
            make.width.equalToSuperview().dividedBy(3.39)
        }
        
        gooutStartTimeUnderButton.snp.makeConstraints { make in
            make.right.equalTo(gooutStartTimeButton).offset(-self.view.frame.width/50)
            make.centerY.equalTo(gooutStartTimeButton)
            make.height.equalTo(gooutStartTimeButton).dividedBy(1.2)
            make.width.equalTo(gooutStartTimeUnderButton.snp.height)
        }
        
        selectedGooutStartTimeLabel.snp.makeConstraints { make in
            make.left.equalTo(gooutStartTimeButton).offset(self.view.frame.width/26.53)
            make.centerY.equalTo(gooutStartTimeButton)
        }
        
        waveLabel.snp.makeConstraints { make in
            make.centerY.equalTo(gooutStartTimeButton)
            make.centerX.equalToSuperview()
        }
        
        gooutEndTimeButton.snp.makeConstraints { make in
            make.centerY.equalTo(gooutStartTimeButton)
            make.width.height.equalTo(gooutStartTimeButton)
            make.right.equalToSuperview().offset(-self.view.frame.width/6.7)
        }
        
        selectedGooutEndTimeLabel.snp.makeConstraints { make in
            make.left.equalTo(gooutEndTimeButton).offset(self.view.frame.width/26.53)
            make.centerY.equalTo(gooutEndTimeButton)
        }
        
        gooutEndTimeUnderButton.snp.makeConstraints { make in
            make.right.equalTo(gooutEndTimeButton).offset(-self.view.frame.width/50)
            make.centerY.equalTo(gooutEndTimeButton)
            make.height.equalTo(gooutEndTimeButton).dividedBy(1.2)
            make.width.equalTo(gooutEndTimeUnderButton.snp.height)
        }
        
        reasonLabel.snp.makeConstraints { make in
            make.left.equalTo(gooutTimeLabel)
            make.top.equalTo(gooutStartTimeButton.snp.bottom).offset(self.view.frame.height/18.04)
        }
        
        reasonTextView.snp.makeConstraints { make in
            make.left.equalTo(reasonLabel).offset(-self.view.frame.width/80)
            make.centerX.equalToSuperview()
            make.top.equalTo(reasonLabel.snp.bottom)
            make.height.equalToSuperview().dividedBy(13)
        }
        
        addButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-self.view.frame.height/10.23)
            make.width.equalToSuperview().dividedBy(1.35)
            make.height.equalToSuperview().dividedBy(19.13)
            make.centerX.equalToSuperview()
        }
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height/10.38))
        let gradient = CAGradientLayer()

        gradient.frame = view.bounds
        gradient.colors = [UIColor(red: 255/255, green: 173/255, blue: 172/255, alpha: 1).cgColor, UIColor(red: 104/255, green: 134/255, blue: 197/255, alpha: 1).cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)

        titleView.layer.insertSublayer(gradient, at: 0)
    }
}

// MARK: - UITextViewDelegate extension
extension AddViewController: UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        reasonTextViewSetting()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == ""{
            reasonTextViewSetting()
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool
    {
        if text == "\n"{
            textView.resignFirstResponder()
        }
        return true
    }
}
