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
    private let homeComingTableView : UITableView = {
        let tableView = UITableView()
        tableView.register(PleaseCheckYourReturnHomeTableCell.self, forCellReuseIdentifier: PleaseCheckYourReturnHomeTableCell.identifier)
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorColor = UIColor.clear
        tableView.backgroundColor = .clear
        
        return tableView
    }()

    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        homeComingTableView.tableFooterView = UIView()
        requestConfirmationCollectionView.contentInset = UIEdgeInsets(top: 0, left: bounds.height/35.30434782, bottom: 0, right: bounds.height/35.30434782)
        homeComingTableView.automaticallyAdjustsScrollIndicatorInsets = false
    }
    
    //MARK: - Selectors
    
    
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
        view.addSubview(homeComingTableView)
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
        homeComingTableView.snp.makeConstraints { (make) in
            make.top.equalTo(comeBackCheck.snp.bottom).offset(bounds.height/90.2222)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
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
