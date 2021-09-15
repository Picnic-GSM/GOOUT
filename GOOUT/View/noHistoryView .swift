//
//  noHistoryView .swift
//  GOOUT
//
//  Created by Ji-hoon Ahn on 2021/09/04.
//

import UIKit

class noHistoryView: UIView {
    
    private let image = UIImageView().then{
        $0.image = UIImage(named: "GOOUT_Undraw_image_post")
        $0.contentMode = .scaleAspectFit
    }
    private let nohistoryLabel = UILabel().then{
        $0.text = "오늘 외출, 조퇴한 학생이 없네요!"
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = .black
    }
    private let nohistoryCheckLabel = UILabel().then{
        $0.text = "외출, 조퇴 요청을 확인해보세요!"
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Medium")
        $0.textColor = .black
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(image)
        addSubview(nohistoryLabel)
        addSubview(nohistoryCheckLabel)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        image.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(frame.height/1.301020)
        }
        nohistoryLabel.snp.makeConstraints { (make) in
            make.top.equalTo(image.snp.bottom).offset(frame.height/11.086957)
            make.centerX.equalToSuperview()
        }
        nohistoryCheckLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nohistoryLabel.snp.bottom).offset(frame.height/51)
            make.centerX.equalToSuperview()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
