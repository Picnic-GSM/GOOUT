//
//  InformationViewController.swift
//  GOOUT
//
//  Created by GSM02 on 2021/09/08.
//

import UIKit
import SnapKit
import Then
import Alamofire
import Firebase

class InformationViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var model: userModel?
    
    var grade = 0
    var `class` = 0
    var s_num = 0
    
    lazy var numList:  [String] = ["1번", "2번", "3번", "4번", "5번", "6번", "7번", "8번", "9번", "10번", "11번", "12번", "13번", "14번", "15번", "16번", "17번", "18번", "19번", "20번"]
    
    lazy var informationLabel = UILabel().then {
        $0.text = "Information"
        $0.dynamicFont(fontSize: 30, currentFontName: "FugazOne-Regular")
        $0.textColor = .rgb(red: 255, green: 172, blue: 183)
    }
    
    lazy var backgroundView = UIView().then {
        $0.backgroundColor = .rgb(red: 255, green: 243, blue: 243)
    }
    
    lazy var gradeLabel = UILabel().then {
        $0.text = "Grade"
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = .rgb(red: 255, green: 172, blue: 183)
    }
    
    lazy var gradeView = UIView().then {
        $0.backgroundColor = .rgb(red: 255, green: 255, blue: 255)
    }
    
    lazy var grade1Button = UIButton().then {
        $0.setTitle("1학년", for: .normal)
        $0.setTitleColor(.rgb(red: 108, green: 108, blue: 108), for: .normal)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.addTarget(self, action: #selector(tabGrade1Button), for: .touchUpInside)
    }
    
    lazy var grade2Button = UIButton().then {
        $0.setTitle("2학년", for: .normal)
        $0.setTitleColor(.rgb(red: 108, green: 108, blue: 108), for: .normal)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.addTarget(self, action: #selector(tabGrade2Button), for: .touchUpInside)
    }
    
    lazy var grade3Button = UIButton().then {
        $0.setTitle("3학년", for: .normal)
        $0.setTitleColor(.rgb(red: 108, green: 108, blue: 108), for: .normal)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.addTarget(self, action: #selector(tabGrade3Button), for: .touchUpInside)
    }
    
    lazy var classLabel = UILabel().then {
        $0.text = "Class"
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = .rgb(red: 255, green: 172, blue: 183)
    }
    
    lazy var classView = UIView().then {
        $0.backgroundColor = .rgb(red: 255, green: 255, blue: 255)
    }
    
    lazy var class1Button = UIButton().then {
        $0.setTitle("1반", for: .normal)
        $0.setTitleColor(.rgb(red: 108, green: 108, blue: 108), for: .normal)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.addTarget(self, action: #selector(tabClass1Button), for: .touchUpInside)
    }
    
    lazy var class2Button = UIButton().then {
        $0.setTitle("2반", for: .normal)
        $0.setTitleColor(.rgb(red: 108, green: 108, blue: 108), for: .normal)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.addTarget(self, action: #selector(tabClass2Button), for: .touchUpInside)
    }
    
    lazy var class3Button = UIButton().then {
        $0.setTitle("3반", for: .normal)
        $0.setTitleColor(.rgb(red: 108, green: 108, blue: 108), for: .normal)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.addTarget(self, action: #selector(tabClass3Button), for: .touchUpInside)
    }
    
    lazy var class4Button = UIButton().then {
        $0.setTitle("4반", for: .normal)
        $0.setTitleColor(.rgb(red: 108, green: 108, blue: 108), for: .normal)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.addTarget(self, action: #selector(tabClass4Button), for: .touchUpInside)
    }
    
    lazy var numberLabel = UILabel().then {
        $0.text = "Number"
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = .rgb(red: 255, green: 172, blue: 183)
    }
    
    lazy var numberCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        $0.collectionViewLayout = layout
        $0.contentInset = UIEdgeInsets.init(top: 0, left: 17, bottom: 0, right: 0)
    }
    
    lazy var signUpButton = UIButton().then {
        $0.setTitle("Sign up", for: .normal)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.backgroundColor = .rgb(red: 255, green: 172, blue: 183)
    }
    
    lazy var loginButton = UIButton().then {
        $0.setTitleColor(.rgb(red: 118, green: 118, blue: 118), for: .normal)
        $0.setTitle("이미 계정이 있으신가요?", for: .normal)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-SemiBold")
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
        shadow()
        collectionViewSetting()
    }
    
    func addSubView() {
        self.view.addSubview(informationLabel)
        self.view.addSubview(backgroundView)
        self.view.addSubview(gradeLabel)
        self.view.addSubview(gradeView)
        self.view.addSubview(grade1Button)
        self.view.addSubview(grade2Button)
        self.view.addSubview(grade3Button)
        self.view.addSubview(classLabel)
        self.view.addSubview(classView)
        self.view.addSubview(class1Button)
        self.view.addSubview(class2Button)
        self.view.addSubview(class3Button)
        self.view.addSubview(class4Button)
        self.view.addSubview(numberLabel)
        self.view.addSubview(signUpButton)
        self.view.addSubview(loginButton)
        self.view.addSubview(numberCollectionView)

        loginButton.addTarget(self, action: #selector(signUpButtonClicked(sender:)), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpButtonClicked(sender:)), for: .touchUpInside)
    }
    
    func cornerRadius() {
        backgroundView.layer.cornerRadius = 50
        backgroundView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        backgroundView.layer.masksToBounds = true
        
        signUpButton.layer.cornerRadius = 8
        
        gradeView.layer.cornerRadius = 8
        
        classView.layer.cornerRadius = 8
        
        numberCollectionView.layer.cornerRadius = 8
    }
    
    func collectionViewSetting(){
        numberCollectionView.register(numberCellView.self, forCellWithReuseIdentifier: numberCellView.identifier)
        
        numberCollectionView.delegate = self
        numberCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        numList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.s_num = indexPath.row + 1
        print(s_num)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: numberCellView.identifier, for: indexPath) as? numberCellView else {
            return UICollectionViewCell()
        }

        cell.numButton.setTitle(numList[indexPath.row], for: .normal)
        cell.backgroundColor = .clear
        return cell
    }
    
    func collectionView(_collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingforSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingforSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 34, bottom: 0, right: 0)
    }
    
    func shadow() {
        backgroundView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        backgroundView.layer.shadowOpacity = 1
        backgroundView.layer.shadowRadius = 10
        backgroundView.layer.shadowOffset = CGSize(width: 0, height: 4)
        backgroundView.clipsToBounds = false
    }
    
    func location() {
        informationLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/7.96)
            make.left.equalToSuperview().offset(self.view.frame.width/8.52)
        }
        
        backgroundView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(1.33)
            make.top.equalToSuperview().offset(self.view.frame.height/4)
        }
        
        gradeLabel.snp.makeConstraints { make in
            make.top.equalTo(backgroundView).offset(self.view.frame.height/10.83)
            make.left.equalToSuperview().offset(self.view.frame.width/6.05)
        }
        
        gradeView.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.5)
            make.height.equalToSuperview().dividedBy(21.37)
            make.top.equalTo(gradeLabel.snp.bottom).offset(self.view.frame.height/135.33)
            make.centerX.equalToSuperview()
        }
        
        grade1Button.snp.makeConstraints { make in
            make.centerY.equalTo(gradeView)
            make.left.equalTo(gradeView).offset(self.view.frame.width/11.03)
        }
        
        grade2Button.snp.makeConstraints { make in
            make.centerY.equalTo(gradeView)
            make.centerX.equalToSuperview()
        }
        
        grade3Button.snp.makeConstraints { make in
            make.centerY.equalTo(gradeView)
            make.right.equalTo(gradeView).inset(self.view.frame.width/11.03)
        }
        
        classLabel.snp.makeConstraints { make in
            make.top.equalTo(backgroundView).offset(self.view.frame.height/5.08)
            make.left.equalTo(gradeLabel)
        }
        
        classView.snp.makeConstraints { make in
            make.width.height.equalTo(gradeView)
            make.top.equalTo(classLabel.snp.bottom).offset(self.view.frame.height/135.33)
            make.centerX.equalToSuperview()
        }
        
        class1Button.snp.makeConstraints { make in
            make.left.equalTo(classView).offset(self.view.frame.width/11.03)
            make.centerY.equalTo(classView)
        }
        
        class2Button.snp.makeConstraints { make in
            make.left.equalTo(classView).offset(self.view.frame.width/4.31)
            make.centerY.equalTo(classView)
        }
        
        class3Button.snp.makeConstraints { make in
            make.right.equalTo(classView).inset(self.view.frame.width/4.12)
            make.centerY.equalTo(classView)
        }
        
        class4Button.snp.makeConstraints { make in
            make.right.equalTo(classView).inset(self.view.frame.width/10.71)
            make.centerY.equalTo(classView)
        }
        
        numberLabel.snp.makeConstraints { make in
            make.top.equalTo(backgroundView).offset(self.view.frame.height/3.31)
            make.left.equalTo(gradeLabel)
        }
        
        numberCollectionView.snp.makeConstraints { make in
            make.height.width.equalTo(gradeView)
            make.top.equalTo(numberLabel.snp.bottom).offset(self.view.frame.height/135.33)
            make.centerX.equalToSuperview()
        }
        
        signUpButton.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.5)
            make.height.equalToSuperview().dividedBy(21.37)
            make.top.equalTo(numberLabel.snp.bottom).offset(self.view.frame.height/10.41)
            make.centerX.equalToSuperview()
        }
        
        loginButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(self.view.frame.height/13.31)
            make.centerX.equalToSuperview()
        }
    }
    
//MARK: - Action
    @objc
    func tabGrade1Button() {
        if grade1Button.titleLabel?.textColor == .rgb(red: 108, green: 108, blue: 108) {
            
            grade1Button.setTitleColor(.rgb(red: 255, green: 172, blue: 183), for: .normal)
            grade2Button.setTitleColor(.rgb(red: 108, green: 108, blue: 108), for: .normal)
            grade3Button.setTitleColor(.rgb(red: 108, green: 108, blue: 108), for: .normal)
            self.grade = 1
            print(grade)
        }else {
            grade1Button.setTitleColor(.rgb(red: 108, green: 108, blue: 108), for: .normal)
            
        }
    }
    
    @objc
    func tabGrade2Button() {
        if grade2Button.titleLabel?.textColor == .rgb(red: 108, green: 108, blue: 108) {
            
            grade2Button.setTitleColor(.rgb(red: 255, green: 172, blue: 183), for: .normal)
            grade1Button.setTitleColor(.rgb(red: 108, green: 108, blue: 108), for: .normal)
            grade3Button.setTitleColor(.rgb(red: 108, green: 108, blue: 108), for: .normal)
            self.grade = 2
        }else {
            grade2Button.setTitleColor(.rgb(red: 108, green: 108, blue: 108), for: .normal)
            
        }
    }
    
    @objc
    func tabGrade3Button() {
        if grade3Button.titleLabel?.textColor == .rgb(red: 108, green: 108, blue: 108) {
            
            grade3Button.setTitleColor(.rgb(red: 255, green: 172, blue: 183), for: .normal)
            grade1Button.setTitleColor(.rgb(red: 108, green: 108, blue: 108), for: .normal)
            grade2Button.setTitleColor(.rgb(red: 108, green: 108, blue: 108), for: .normal)
            self.grade = 3
        }else {
            grade3Button.setTitleColor(.rgb(red: 108, green: 108, blue: 108), for: .normal)
            
        }
    }
    
    @objc
    func tabClass1Button() {
        if class1Button.titleLabel?.textColor == .rgb(red: 108, green: 108, blue: 108) {
            
            class1Button.setTitleColor(.rgb(red: 255, green: 172, blue: 183), for: .normal)
            class2Button.setTitleColor(.rgb(red: 108, green: 108, blue: 108), for: .normal)
            class3Button.setTitleColor(.rgb(red: 108, green: 108, blue: 108), for: .normal)
            class4Button.setTitleColor(.rgb(red: 108, green: 108, blue: 108), for: .normal)
            self.class = 1
            print(self.class)
        }else {
            class1Button.setTitleColor(.rgb(red: 108, green: 108, blue: 108), for: .normal)
            
        }
    }
    
    @objc
    func tabClass2Button() {
        if class2Button.titleLabel?.textColor == .rgb(red: 108, green: 108, blue: 108) {
            
            class2Button.setTitleColor(.rgb(red: 255, green: 172, blue: 183), for: .normal)
            class1Button.setTitleColor(.rgb(red: 108, green: 108, blue: 108), for: .normal)
            class3Button.setTitleColor(.rgb(red: 108, green: 108, blue: 108), for: .normal)
            class4Button.setTitleColor(.rgb(red: 108, green: 108, blue: 108), for: .normal)
            self.class = 2
        }else {
            class2Button.setTitleColor(.rgb(red: 108, green: 108, blue: 108), for: .normal)
            
        }
    }
    
    @objc
    func tabClass3Button() {
        if class3Button.titleLabel?.textColor == .rgb(red: 108, green: 108, blue: 108) {
            
            class3Button.setTitleColor(.rgb(red: 255, green: 172, blue: 183), for: .normal)
            class1Button.setTitleColor(.rgb(red: 108, green: 108, blue: 108), for: .normal)
            class2Button.setTitleColor(.rgb(red: 108, green: 108, blue: 108), for: .normal)
            class4Button.setTitleColor(.rgb(red: 108, green: 108, blue: 108), for: .normal)
            self.class = 3
        }else {
            class3Button.setTitleColor(.rgb(red: 108, green: 108, blue: 108), for: .normal)
            
        }
    }
    
    @objc
    func tabClass4Button() {
        if class4Button.titleLabel?.textColor == .rgb(red: 108, green: 108, blue: 108) {
            
            class4Button.setTitleColor(.rgb(red: 255, green: 172, blue: 183), for: .normal)
            class1Button.setTitleColor(.rgb(red: 108, green: 108, blue: 108), for: .normal)
            class2Button.setTitleColor(.rgb(red: 108, green: 108, blue: 108), for: .normal)
            class3Button.setTitleColor(.rgb(red: 108, green: 108, blue: 108), for: .normal)
            self.class = 4
        }else {
            class4Button.setTitleColor(.rgb(red: 108, green: 108, blue: 108), for: .normal)
            
        }
    }
    
    @objc
    func signUpButtonClicked(sender:UIButton){
        guard let model = model else { return }
        if self.grade == 0 || self.class == 0 || self.s_num == 0{
            return
        }
        print( model )
        Auth.auth().createUser(withEmail: model.email, password: model.password) { res, err in
            print(res)
            print(err?.localizedDescription)
        }
        
        let mod: [String:Any] = ["email":model.email,
                     "password":model.password,
                     "name":model.name,
                     "grade":self.grade,
                     "class":self.class,
                     "s_number":self.s_num]
        
        Firestore.firestore().collection("users").addDocument(data: mod)
        
        

//
    }
}
