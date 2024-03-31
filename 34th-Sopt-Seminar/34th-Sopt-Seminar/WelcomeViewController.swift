//
//  WelcomeViewController.swift
//  34th-Sopt-Seminar
//
//  Created by 김민서 on 2024/03/31.
//

import Foundation
import UIKit

class WelcomeViewController:UIViewController{
    
    var id: String?
    
    private let imageView : UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 112, y: 87, width: 150, height: 150))
        imageView.image = UIImage(named:"puppy.png")
        
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 140, y: 295, width: 95, height: 60))
        label.text = "???님\n반가워요!"
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name:"Pretendard-ExtraBold",size:25)
        return label
    }()
  
    private lazy var mainButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 426, width: 335, height: 58))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name:"Pretendard-Bold",size:18)
        button.layer.cornerRadius = 6
        return button
    }()
    
    private lazy var backTologinButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 498, width: 335, height: 58))
        button.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        button.setTitle("다시 로그인", for: .normal)
        button.setTitleColor(UIColor(red: 172/255, green: 176/255, blue: 185/255, alpha: 1), for: .normal)
        button.layer.cornerRadius = 6
        button.titleLabel?.font = UIFont(name:"Pretendard-Bold",size:18)
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for:.touchUpInside)
        return button
    }()
    
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
    
    //데이터 바인딩 함수 구현 -> 옵셔널 바인딩 사용
    private func bindID(){
        guard let idText = id else { return }
        self.welcomeLabel.text="\(idText)님 \n반가워요!"
    }
    
    func setLabelText(id: String?) {
            self.id = id
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        [imageView,welcomeLabel,mainButton,backTologinButton].forEach{
            self.view.addSubview($0)
        }
        
        bindID()
    }
    
   
}
