//
//  WelcomeViewController.swift
//  34th-Sopt-Seminar
//
//  Created by 김민서 on 2024/03/31.
//

import Foundation
import UIKit
import Then

final class WelcomeViewController: UIViewController {
    
    private var id: String?
    
    private let imageView = UIImageView()
    private let welcomeLabel = UILabel()
    private lazy var mainButton = UIButton()
    private lazy var backToLoginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
        self.view.backgroundColor = .white
        
        //백 버튼 없애기
        self.navigationController?.isNavigationBarHidden = true
        [imageView, welcomeLabel, mainButton, backToLoginButton].forEach{
            self.view.addSubview($0)
        }
        
        bindID()
    }
    
    private func setLayout() {
        [imageView, welcomeLabel, mainButton, backToLoginButton].forEach { [weak self] view in
            guard let self = self else { return }
            self.view.addSubview(view)
        }
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(87)
            $0.leading.equalToSuperview().inset(112)
            $0.trailing.equalToSuperview().inset(113)
            $0.width.equalTo(150)
            $0.height.equalTo(150)
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(58)
            $0.leading.equalToSuperview().inset(140)
            $0.trailing.equalToSuperview().inset(140)
        }
        
        mainButton.snp.makeConstraints {
            $0.top.equalTo(welcomeLabel.snp.bottom).offset(71)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(58)
        }
        
        backToLoginButton.snp.makeConstraints {
            $0.top.equalTo(mainButton.snp.bottom).offset(14)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(58)
        }
        
    }
    
    func setStyle(){
        //이미지
        imageView.do {
            $0.image = UIImage(named: "puppy.png")
        }
        
        //환영 텍스트
        welcomeLabel.do {
            $0.text = "???님\n반가워요!"
            $0.textColor = .black
            $0.textAlignment = .center
            $0.numberOfLines = 2
            $0.font = UIFont(name: "Pretendard-ExtraBold", size: 25)
        }
        
        //메인으로 가는 버튼
        mainButton.do {
            $0.backgroundColor = UIColor(resource: .primaryOrange)
            $0.setTitle("메인으로", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.layer.cornerRadius = 6
            $0.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
            $0.addTarget(self, action: #selector(mainButtonDidTap), for: .touchUpInside)
        }
        //로그인으로 되돌아가기 버튼
        backToLoginButton.do {
            $0.backgroundColor = UIColor(resource: .grey200)
            $0.setTitle("다시 로그인", for: .normal)
            $0.setTitleColor(UIColor(resource: .grey300), for: .normal)
            $0.layer.cornerRadius = 6
            $0.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
            $0.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
            
        }
    }
    @objc
    private func mainButtonDidTap() {
        pushToWelcomeVC()
    }
    
    //네비게이션 방식
    private func pushToWelcomeVC(){
        let ItemViewController = ItemViewController()
        self.navigationController?
            .pushViewController(ItemViewController, animated:true)
    }
    
    //데이터 바인딩 함수 구현 -> 옵셔널 바인딩 사용
    private func bindID() {
        guard let idText = id else { return }
        self.welcomeLabel.text="\(idText)님 \n반가워요!"
    }
    
    //외부에서도 접근할 수 있도록
    func setLabelText(id: String?) {
        self.id = id
    }
    
    

    //이전 화면으로 가기
    @objc
    private func backToLoginButtonDidTap(){
        //nav controller 사용시 dismiss 방식
        if self.navigationController == nil {
               self.dismiss(animated: true)
           } else {//그게 아닐 시 pop 방식
               self.navigationController?.popViewController(animated: true)
           }
    }
    
}
