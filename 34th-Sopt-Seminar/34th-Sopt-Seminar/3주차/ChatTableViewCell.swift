//
//  ChatTableViewCell.swift
//  34th-Sopt-Seminar
//
//  Created by 김민서 on 4/20/24.
//

import UIKit

class ChatTableViewCell: UITableViewCell {
    //셀 식별자 생성하기..?
    static let identifier = "ChatTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private let profileImageView = UIImageView()
    private let nameLabel = UILabel()
    private let placeLabel = UILabel()
    private let chatLabel = UILabel()
    private let itemImageView = UIImageView()
    
    func setStyle() {
        //타이틀 텍스트
        nameLabel.do {
            $0.text = "타마마★"
            $0.textColor = .black
            $0.textAlignment = .center
            $0.numberOfLines = 2
            $0.font = UIFont(name: "Pretendard-Bold", size: 15)
        }
        placeLabel.do {
            $0.text = "문정동"
            $0.textColor = UIColor(resource: .grey400)
            $0.textAlignment = .center
            $0.numberOfLines = 2
            $0.font = UIFont(name: "Pretendard-Medium", size: 12)
        }
        chatLabel.do {
            $0.text = "확인했습니다 감사합니다!"
            $0.textColor = .black
            $0.textAlignment = .center
            $0.numberOfLines = 2
            $0.font = UIFont(name: "Pretendard-Medium", size: 14)
        }
        itemImageView.do {
            $0.image = UIImage(named: "tamama.jpeg")
        }
        
    }
    
    func setLayout() {
        [profileImageView, nameLabel, placeLabel, chatLabel, itemImageView].forEach {
                    contentView.addSubview($0)
                }
        profileImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalToSuperview().inset(16)
            $0.height.equalTo(40)
            $0.width.equalTo(40)
        }
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(16)
            $0.top.equalTo(profileImageView)
        }
        placeLabel.snp.makeConstraints {
            $0.leading.equalTo(nameLabel.snp.trailing).offset(4)
            $0.top.equalTo(profileImageView.snp.top).offset(2)
        }
        chatLabel.snp.makeConstraints {
            $0.leading.equalTo(nameLabel)
            $0.bottom.equalTo(profileImageView.snp.bottom)
        }
        itemImageView.snp.makeConstraints {
                    $0.trailing.bottom.equalToSuperview().inset(16)
                    $0.size.equalTo(40)
                }
    }
    
}
extension ChatTableViewCell {
    func dataBind(_ chatData: ChatModel) {
        profileImageView.image = chatData.profileImg
        nameLabel.text = chatData.name
        placeLabel.text = chatData.place
        chatLabel.text = chatData.message
        itemImageView.image = chatData.itemImg
    }
}
