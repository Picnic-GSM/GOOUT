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
//        tableView.register(<#T##cellClass: AnyClass?##AnyClass?#>, forCellReuseIdentifier: <#T##String#>)
        return tableView
    }()

    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        requestConfirmationCollectionView.delegate = self
        requestConfirmationCollectionView.dataSource = self
        homeComingTableView.delegate = self
        homeComingTableView.dataSource = self
        requestConfirmationCollectionView.contentInset = UIEdgeInsets(top: 0, left: view.frame.height/35.30434782, bottom: 0, right: view.frame.height/35.30434782)
    }
    
    //MARK: - Selectors
    
    
    //MARK: - Helper
    func configureUI(){
        view.backgroundColor = .white
        addView()
        location()
    }
    func addView(){
        view.addSubview(eachClassTitle)
        view.addSubview(requestConfirmationLabel)
        view.addSubview(requestConfirmationCollectionView)
        view.addSubview(comeBackCheck)
    }
    func location(){

        eachClassTitle.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(view.frame.height/11.4366)
            make.left.equalToSuperview().offset(view.frame.height/24.6)
        }
        requestConfirmationLabel.snp.makeConstraints { (make) in
            make.top.equalTo(eachClassTitle.snp.bottom).offset(view.frame.height/23.882)
            make.left.equalToSuperview().offset(view.frame.height/28)
      
        }
        requestConfirmationCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(requestConfirmationLabel.snp.bottom).offset(view.frame.height/62.4615)
            make.width.equalToSuperview()
            make.height.equalTo(view.frame.height/5.13924)
        }
        comeBackCheck.snp.makeConstraints { (make) in
            make.top.equalTo(requestConfirmationCollectionView.snp.bottom).offset(view.frame.height/21.945945)
            make.left.equalToSuperview().offset(view.frame.height/31.23076)
        }

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
        cell.layer.cornerRadius = view.frame.height/81.2
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/3.09917, height: view.frame.height/5.139240)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return view.frame.height/54.133
    }

}
//extension InquiryForEachClassViewController : UITableViewDelegate,UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: ) 
//        return cell
//    }
//    
//    
//}
