//
//  LoginViewController.swift
//  34th-Sopt-Seminar
//
//  Created by 김민서 on 2024/03/31.
//

import Foundation
import UIKit
import Then//Then 라이브러리
import SnapKit

final class LoginViewController: UIViewController{
    //UILabel
    private let titleLabel = UILabel()
    private let idTextField = UITextField()
    private let passwordTextField = UITextField()
    private lazy var loginButton = UIButton()
    private let joinAskLabel = UILabel()
    private let joinLabel = UIButton()
    
    
    //auto layout
    private func setLayout() {
        [titleLabel, idTextField, passwordTextField, loginButton, joinLabel].forEach { [weak self] view in
            guard let self = self else { return }
            self.view.addSubview(view)
        }

        
      
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(161)
            $0.leading.equalToSuperview().inset(69)
            $0.trailing.equalToSuperview().inset(69)
            
        }
        idTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(71)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(35)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(58)
        }
        
        
        joinLabel.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview()
        }

    }
    func setStyle(){
        //타이틀 텍스트
        titleLabel.do {
            $0.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
            $0.textColor = .black
            $0.textAlignment = .center
            $0.numberOfLines = 2
            $0.font = UIFont(name: "Pretendard-Bold", size: 18)
        }
        
        //아이디 입력창
        idTextField.do {
            $0.placeholder = "아이디"
            $0.font = UIFont(name: "Pretendard-Medium", size: 14)
            $0.backgroundColor = UIColor(resource: .grey200)
            $0.layer.cornerRadius = 3
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: $0.frame.height))
            $0.leftView = paddingView
            $0.leftViewMode = .always
        }
        
        //바말번호 입력창
        passwordTextField.do {
            $0.placeholder = "비밀번호"
            $0.font = UIFont(name: "Pretendard-Medium", size: 14)
            $0.backgroundColor = UIColor(resource: .grey200)
            $0.layer.cornerRadius = 3
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: $0.frame.height))
            $0.leftView = paddingView
            $0.leftViewMode = .always
        }
        
        //로그인 입력창
        loginButton.do {
            $0.backgroundColor = UIColor(resource: .primaryOrange)
            $0.setTitle("로그인하기", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
            $0.layer.cornerRadius = 6
            
            //버튼 이벤트
            $0.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        }
        
        joinLabel.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.setTitle("아직 계정이 없으신가요? 회원가입 하기", for: .normal)
            $0.setTitleColor(.grey400, for: .normal)
            $0.titleLabel?.font = UIFont(name: "Pretendard-Semibold", size: 14)
            $0.underlineTitle(forTitle: $0.titleLabel?.text ?? "")
            $0.underlineTitle(forTitle: "회원가입 하기")
            $0.addTarget(self, action: #selector(joinButtonDidTap), for: .touchUpInside)
            
        }
        
        
    }


   
    @objc
    private func loginButtonDidTap() {
        pushToWelcomeVC()
    }
    
    @objc
    private func joinButtonDidTap() {
        pushToWelcomeJoin()
    }
    
    //모달 방식
    private func presentToWelcomeVC(){
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.modalPresentationStyle = .formSheet
        welcomeViewController.setLabelText(id: idTextField.text)
        //welcomeViewController.id = idTextField.text
        self.present(welcomeViewController, animated: true)
    }
    
    //네비게이션 방식
    private func pushToWelcomeVC(){
        let welcomeViewController = WelcomeViewController()
        //welcomeViewController.id = idTextField.text
        welcomeViewController.setLabelText(id: idTextField.text)
        self.navigationController?
            .pushViewController(welcomeViewController, animated:true)
    }
    
    private func pushToWelcomeJoin(){
        let joinViewController = SignUpViewController()
        self.navigationController?
            .pushViewController(joinViewController, animated:true)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
        self.view.backgroundColor = .white
    
        
    }
}

extension UIButton {
 
    func underlineTitle(forTitle: String) {
        guard let buttonTitle = self.titleLabel?.text else { return }
        
        let rangeToUnderLine = (buttonTitle as NSString).range(of: forTitle)
        
        let underLineTitle = NSMutableAttributedString(string: buttonTitle)
        underLineTitle.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: rangeToUnderLine)
        
        self.setAttributedTitle(underLineTitle, for: .normal)
    }
}
