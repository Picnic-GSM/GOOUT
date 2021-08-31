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
    
    lazy var studentNameLabel = UILabel().then{
        $0.text = "학생이름"
        $0.textColor = UIColor(red: 105/255, green: 105/255, blue: 105/255, alpha: 1)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    lazy var studentNameTextField = UITextField().then{
        $0.placeholder = "이름을 입력해주세요."
        $0.dynamicFont(fontSize: 11, currentFontName: "AppleSDGothicNeo-Light")
    }
    
    lazy var studentNameTextFieldUnderLineView = UIView().then{
        $0.backgroundColor = UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1)
    }
    
    lazy var classLabel = UILabel().then{
        $0.text = "반"
        $0.textColor = UIColor(red: 105/255, green: 105/255, blue: 105/255, alpha: 1)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    lazy var numberLabel = UILabel().then{
        $0.text = "반"
        $0.textColor = UIColor(red: 105/255, green: 105/255, blue: 105/255, alpha: 1)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    lazy var gooutTimeLabel = UILabel().then{
        $0.text = "외출시간"
        $0.textColor = UIColor(red: 105/255, green: 105/255, blue: 105/255, alpha: 1)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    lazy var classButton = UIButton().then{
        $0.layer.borderWidth = 0.6
        $0.layer.borderColor = UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1).cgColor
        $0.layer.cornerRadius = 7
    }
    
    lazy var selectedClassLabel = UILabel().then{
        $0.text = "1반"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Light")
        $0.textColor = UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1)
    }
    
    lazy var classUnderButton = UIButton().then{
        $0.setImage(UIImage(named: "GOOUT_UnderButtonImage"), for: .normal)
    }
    
    lazy var classDropDown = DropDown().then{
        $0.dataSource = ["1반", "2반", "3반", "4반"]
        $0.anchorView = classButton
        $0.bottomOffset = CGPoint(x: 0, y: self.view.frame.height/20)
        $0.textFont = UIFont(name: "AppleSDGothicNeo-Light", size: 11)!
        $0.backgroundColor = UIColor.white
        $0.cornerRadius = 7
        $0.cellHeight = self.view.frame.height/26
        $0.shadowColor = UIColor.lightGray
        $0.shadowOffset = CGSize(width: 0, height: 3)
        $0.shadowRadius = 10
        $0.shadowOpacity = 0.3
    }
    
    lazy var numberButton = UIButton().then{
        $0.layer.borderWidth = 0.6
        $0.layer.borderColor = UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1).cgColor
        $0.layer.cornerRadius = 7
    }
    
    lazy var selectedNumberLabel = UILabel().then{
        $0.text = "1번"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Light")
        $0.textColor = UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1)
    }
    
    lazy var numberUnderButton = UIButton().then{
        $0.setImage(UIImage(named: "GOOUT_UnderButtonImage"), for: .normal)
    }
    
    lazy var numberDropDown = DropDown().then{
        $0.dataSource = ["1번", "2번", "3번", "4번","5번", "6번", "7번", "8번","9번", "10번", "11번", "12번","13번", "14번", "15번", "16번","17번", "18번", "19번", "20번"]
        $0.anchorView = numberButton
        $0.direction = .bottom
        $0.offsetFromWindowBottom = self.view.frame.height/3.5
        $0.bottomOffset = CGPoint(x: 0, y: self.view.frame.height/20)
        $0.textFont = UIFont(name: "AppleSDGothicNeo-Light", size: 11)!
        $0.backgroundColor = UIColor.white
        $0.cornerRadius = 7
        $0.cellHeight = self.view.frame.height/26
        $0.shadowColor = UIColor.lightGray
        $0.shadowOffset = CGSize(width: 0, height: 3)
        $0.shadowRadius = 10
        $0.shadowOpacity = 0.3
    }
    
    // MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutSetting()
    }
    
    @objc func gooutButtonClicked(sender:UIButton){
        if gooutButton.isSelected == true{
            gooutButton.setImage(UIImage(named: "GOOUT_SelectedCheckButtonImage"), for: .normal)
            earlyLeaveButton.setImage(UIImage(named: "GOOUT_CheckButtonImage"), for: .normal)
            earlyLeaveButton.isSelected.toggle()
            gooutButton.isSelected.toggle()
        }
    }
    
    @objc func earlyLeaveButtonClicked(sender:UIButton){
        if earlyLeaveButton.isSelected == false{
            earlyLeaveButton.setImage(UIImage(named: "GOOUT_SelectedCheckButtonImage"), for: .normal)
            gooutButton.setImage(UIImage(named: "GOOUT_CheckButtonImage"), for: .normal)
            gooutButton.isSelected.toggle()
            earlyLeaveButton.isSelected.toggle()
        }
    }
    
    @objc func numberButtonClicked(sender:UIButton){
        numberDropDown.show()
    }
    
    @objc func classButtonClicked(sender:UIButton){
        classDropDown.show()
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
        self.view.addSubview(studentNameLabel)
        self.view.addSubview(studentNameTextField)
        self.view.addSubview(studentNameTextFieldUnderLineView)
        self.view.addSubview(classLabel)
        self.view.addSubview(numberLabel)
        self.view.addSubview(gooutTimeLabel)
        self.view.addSubview(classButton)
        self.view.addSubview(selectedClassLabel)
        self.view.addSubview(classUnderButton)
        self.view.addSubview(classDropDown)
        self.view.addSubview(numberButton)
        self.view.addSubview(selectedNumberLabel)
        self.view.addSubview(numberUnderButton)
        self.view.addSubview(numberDropDown)
        
        gooutButton.addTarget(self, action: #selector(gooutButtonClicked(sender:)), for: .touchUpInside)
        earlyLeaveButton.addTarget(self, action: #selector(earlyLeaveButtonClicked(sender:)), for: .touchUpInside)
        classButton.addTarget(self, action: #selector(classButtonClicked(sender:)), for: .touchUpInside)
        classUnderButton.addTarget(self, action: #selector(classButtonClicked(sender:)), for: .touchUpInside)
        numberButton.addTarget(self, action: #selector(numberButtonClicked(sender:)), for: .touchUpInside)
        numberUnderButton.addTarget(self, action: #selector(numberButtonClicked(sender:)), for: .touchUpInside)
        
        classDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            selectedClassLabel.text = "\(item)"
            self.classDropDown.clearSelection()
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
        
        studentNameLabel.snp.makeConstraints { make in
            make.top.equalTo(whiteView.snp.bottom).offset(self.view.frame.height/14)
            make.left.equalToSuperview().offset(self.view.frame.width/6.7)
        }
        
        studentNameTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalTo(studentNameLabel)
            make.height.equalToSuperview().dividedBy(23)
            make.top.equalTo(studentNameLabel.snp.bottom)
        }
        
        studentNameTextFieldUnderLineView.snp.makeConstraints { make in
            make.top.equalTo(studentNameTextField.snp.bottom)
            make.width.equalTo(studentNameTextField)
            make.height.equalTo(0.6)
            make.centerX.equalToSuperview()
        }
        
        classLabel.snp.makeConstraints { make in
            make.left.equalTo(studentNameTextFieldUnderLineView)
            make.top.equalTo(studentNameTextFieldUnderLineView.snp.bottom).offset(self.view.frame.height/26.92)
        }
        
        classButton.snp.makeConstraints { make in
            make.left.equalTo(classLabel)
            make.width.equalToSuperview().dividedBy(3.52)
            make.height.equalToSuperview().dividedBy(25.96)
            make.top.equalTo(classLabel.snp.bottom).offset(self.view.frame.height/103.85)
        }
        
        selectedClassLabel.snp.makeConstraints { make in
            make.left.equalTo(classButton).offset(self.view.frame.width/26.53)
            make.centerY.equalTo(classButton)
        }
        
        classUnderButton.snp.makeConstraints { make in
            make.right.equalTo(classButton).offset(-self.view.frame.width/50)
            make.centerY.equalTo(classButton)
            make.height.equalTo(classButton).dividedBy(1.2)
            make.width.equalTo(classUnderButton.snp.height)
        }
        
        numberButton.snp.makeConstraints { make in
            make.right.equalTo(studentNameTextFieldUnderLineView)
            make.height.width.top.equalTo(classButton)
        }
        
        selectedNumberLabel.snp.makeConstraints { make in
            make.left.equalTo(numberButton).offset(self.view.frame.width/26.53)
            make.centerY.equalTo(numberButton)
        }
        
        numberUnderButton.snp.makeConstraints { make in
            make.right.equalTo(numberButton).offset(-self.view.frame.width/50)
            make.centerY.equalTo(numberButton)
            make.height.equalTo(numberButton).dividedBy(1.2)
            make.width.equalTo(numberUnderButton.snp.height)
        }
        
        // MARK: - lineView gradient
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
