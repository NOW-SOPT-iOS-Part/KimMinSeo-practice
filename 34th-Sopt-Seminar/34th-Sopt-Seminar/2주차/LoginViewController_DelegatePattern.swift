//
//  LoginViewController.swift
//  34th-Sopt-Seminar
//
//  Created by 김민서 on 2024/03/31.
//

import Foundation
import UIKit
import Then//Then 라이브러리

final class LoginViewController_DelegatePattern: UIViewController, DataBindProtocol{
    
    func dataBind(id: String?) {
        idTextField.text = "\(id)에서 어떤걸로 할꺼얌?"
    }

    
    //UILabel
    private let titleLabel = UILabel()
    private let idTextField = UITextField()
    private let passwordTextField = UITextField()
    private lazy var loginButton = UIButton()
    

    func setStyle(){
        //타이틀 텍스트
        titleLabel.do {
            $0.frame = CGRect(x: 69, y: 161, width: 236, height: 44)
            $0.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
            $0.textColor = .black
            $0.textAlignment = .center
            $0.numberOfLines = 2
            $0.font = UIFont(name: "Pretendard-Bold", size: 18)
        }
        
        //아이디 입력창
        idTextField.do {
            $0.frame = CGRect(x: 20, y: 276, width: 335, height: 52)
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
            $0.frame = CGRect(x: 20, y: 335, width: 335, height: 52)
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
            $0.frame = CGRect(x: 21, y: 422, width: 332, height: 58)
            $0.backgroundColor = UIColor(resource: .primaryOrange)
            $0.setTitle("로그인하기", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
            $0.layer.cornerRadius = 6
            
            //버튼 이벤트
            $0.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        }
        
    }

    
   
    @objc
    private func loginButtonDidTap() {
        presentToWelcomeVC()
        //pushToWelcomeVC()
    }
    
    
    //모달 방식
    private func presentToWelcomeVC(){
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.modalPresentationStyle = .formSheet
        welcomeViewController.setLabelText(id: idTextField.text)
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
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        self.view.backgroundColor = .white
    
        [titleLabel, idTextField, passwordTextField, loginButton].forEach{
            self.view.addSubview($0)
        }
        
    }
}
