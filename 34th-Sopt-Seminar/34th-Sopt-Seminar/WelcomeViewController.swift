//
//  WelcomeViewController.swift
//  34th-Sopt-Seminar
//
//  Created by 김민서 on 2024/03/31.
//

import Foundation
import UIKit
import Then

class WelcomeViewController: UIViewController {
    
    private var id: String?
    
    private let imageView = UIImageView()
    private let welcomeLabel = UILabel()
    private lazy var mainButton = UIButton()
    private lazy var backToLoginButton = UIButton()
    
    func setStyle(){
        //이미지
        imageView.do{
            $0.frame = CGRect(x: 112, y: 87, width: 150, height: 150)
            $0.image = UIImage(named: "puppy.png")
        }
        
        //환영 텍스트
        welcomeLabel.do{
            $0.frame = CGRect(x: 140, y: 295, width: 95, height: 60)
            $0.text = "???님\n반가워요!"
            $0.textColor = .black
            $0.textAlignment = .center
            $0.numberOfLines = 2
            $0.font = UIFont(name: "Pretendard-ExtraBold", size: 25)
        }
        
        //메인으로 가는 버튼
        mainButton.do{
            $0.frame = CGRect(x: 20, y: 426, width: 335, height: 58)
            $0.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
            $0.setTitle("메인으로", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.layer.cornerRadius = 6
            $0.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        }
        //로그인으로 되돌아가기 버튼
        backToLoginButton.do{
            $0.frame = CGRect(x: 20, y: 498, width: 335, height: 58)
            $0.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
            $0.setTitle("다시 로그인", for: .normal)
            $0.setTitleColor(UIColor(red: 172/255, green: 176/255, blue: 185/255, alpha: 1), for: .normal)
            $0.layer.cornerRadius = 6
            $0.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
            $0.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
            
        }
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        self.view.backgroundColor = .white
        [imageView, welcomeLabel, mainButton, backToLoginButton].forEach{
            self.view.addSubview($0)
        }
        
        bindID()
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
