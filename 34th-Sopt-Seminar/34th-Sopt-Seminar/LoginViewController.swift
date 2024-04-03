//
//  LoginViewController.swift
//  34th-Sopt-Seminar
//
//  Created by 김민서 on 2024/03/31.
//

import Foundation
import UIKit

class LoginViewController: UIViewController{
    //UILabel
    
    //타이틀 텍스트
    private let titleLabel: UILabel = {
        let label = UILabel (frame: CGRect(x:69,y:161,width:236,height:44))
        label.text = "동네라서 가능한 모든 것\n 당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name:"Pretendard-Bold",size: 18)
        
        return label
    }()
    
    //아이디 입력창
    private let idTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 276, width: 335, height: 52))
        textField.placeholder = "아이디"
        textField.font = UIFont(name:"Pretendard-Medium",size:14)
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        textField.layer.cornerRadius = 3
        //padding
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: textField.frame.height))
            textField.leftView = paddingView
            textField.leftViewMode = .always
        return textField
    }()
    
    //비밀번호 입력창
    private let passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 335, width: 335, height: 52))
        textField.placeholder = "비밀번호"
        textField.font = UIFont(name:"Pretendard-Medium",size:14)
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        textField.layer.cornerRadius = 3
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: textField.frame.height))
            textField.leftView = paddingView
            textField.leftViewMode = .always
        return textField
    }()
    
    //로그인 버튼
    private lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 21, y: 422, width: 332, height: 58))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name:"Pretendard-Bold",size:18)
        button.layer.cornerRadius = 6
        
        //버튼 이벤트
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
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
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        [titleLabel,idTextField,passwordTextField,loginButton].forEach{
            self.view.addSubview($0)
        }
        
    }
}
