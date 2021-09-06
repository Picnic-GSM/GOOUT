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
    lazy var mainTabBarView = MainTabBarView()

    lazy var viewControllerView = UIView().then{
        $0.backgroundColor = .systemPink
    }
    
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
    private let homeComingTableView : UITableView = {
        let tableView = UITableView()
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

    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        homeComingTableView.tableFooterView = UIView()
        requestConfirmationCollectionView.contentInset = UIEdgeInsets(top: 0, left: bounds.height/35.30434782, bottom: 0, right: bounds.height/35.30434782)
        homeComingTableView.automaticallyAdjustsScrollIndicatorInsets = false
        homeComingTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: bounds.height/10.15, right: 0)
        //TabBar
        layoutSetting()

        mainTabBarViewSetting()
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
    
    //MARK: - Helper
    func configureUI(){
        view.backgroundColor = .white
        addView()
        location()
        CollectionViewAndTableViewSetting()
    }
    func CollectionViewAndTableViewSetting(){
        requestConfirmationCollectionView.delegate = self
        requestConfirmationCollectionView.dataSource = self
        homeComingTableView.delegate = self
        homeComingTableView.dataSource = self
        homeComingTableView.allowsSelection = false
    }
    func addView(){
        view.addSubview(eachClassTitle)
        view.addSubview(requestConfirmationLabel)
        view.addSubview(requestConfirmationCollectionView)
        view.addSubview(comeBackCheck)
        view.addSubview(statusView)
        view.addSubview(homeComingTableView)
        view.addSubview(noHistory)
    }
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
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        noHistory.snp.makeConstraints { (make) in
            make.width.equalTo(view.frame.width/1.27986)
            make.height.equalTo(view.frame.height/3.184314)
            make.centerX.equalToSuperview()
            make.top.equalTo(comeBackCheck).offset(view.frame.height/11.768)
            
        }
        
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
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
extension InquiryForEachClassViewController : UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: requestConfirmationCell.identifier, for: indexPath) as! requestConfirmationCell
        cell.backgroundColor = .white
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.clipsToBounds = true
        cell.layer.cornerRadius = bounds.height/81.2
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: bounds.width/3.09917, height: bounds.height/5.139240)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return bounds.height/54.133
    }

}
extension InquiryForEachClassViewController : UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PleaseCheckYourReturnHomeTableCell.identifier) as! PleaseCheckYourReturnHomeTableCell
        cell.clipsToBounds = true
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return bounds.height/11.76811
    }
    
}
