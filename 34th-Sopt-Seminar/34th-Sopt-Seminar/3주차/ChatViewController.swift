//
//  ChatViewController.swift
//  34th-Sopt-Seminar
//
//  Created by 김민서 on 4/20/24.
//

import Foundation
import UIKit
import SnapKit

final class ChatViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    private let chatList = ChatModel.dummy()
    private let chatLabel = UILabel()
    private let qrIcon = UIButton()
    private let alarmIcon = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setStyle()
        setLayout()
        setDelegate()
        register()
    }
    
    func setStyle() {
        chatLabel.do {
            $0.text = "채팅"
            $0.textColor = .black
            $0.textAlignment = .center
            $0.font = UIFont(name: "Pretendard-Bold", size: 18)
        }
        qrIcon.do {
            $0.setImage(UIImage(resource: .qrIcon), for: .normal)
        }
        alarmIcon.do {
            $0.setImage(UIImage(resource: .alarmIcon), for: .normal)
        }
    }
    
    private func setLayout() {
        [
            chatLabel,
            qrIcon,
            alarmIcon
        ].forEach { [weak self] view in
            guard let self = self else { return }
            self.view.addSubview(view)
        }
        
        chatLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(59)
            $0.leading.equalToSuperview().inset(16)
        }
        
        qrIcon.snp.makeConstraints {
            $0.top.equalTo(chatLabel)
            $0.trailing.equalTo(alarmIcon.snp.leading).offset(-16)
            $0.width.equalTo(24)
            $0.height.equalTo(24)
        }
        alarmIcon.snp.makeConstraints {
            $0.top.equalTo(chatLabel)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(24)
            $0.height.equalTo(24)
        }
        self.view.addSubview(tableView) // tableView를 self.view에 추가
        tableView.snp.makeConstraints {
            $0.top.equalTo(chatLabel.snp.bottom).offset(12) // chatLabel의 아래에 배치
            $0.leading.trailing.bottom.equalToSuperview() // 모든 가장자리에 제약 추가
        }
    }

    private func register() {
        tableView.register(
            ChatTableViewCell.self,
            forCellReuseIdentifier: ChatTableViewCell.identifier
        )
    }
    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}

extension ChatViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 6
  }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.identifier, for: indexPath) as? ChatTableViewCell else { return UITableViewCell() }
        cell.dataBind(chatList[indexPath.row])
        return cell
    }
}

