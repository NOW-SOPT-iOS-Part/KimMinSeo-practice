//
//  ScrollViewController.swift
//  34th-Sopt-Seminar
//
//  Created by 김민서 on 2024/04/06.
//

import Foundation
import UIKit
import SnapKit

class ScrollViewController: UIViewController {

    private let scrollView = UIScrollView()
    private var contentView = UIView()
    
    private let redView = UIView()
    private let orangeView = UIView()
    private let yellowView = UIView()
    private let greenView = UIView()
    private let blueView = UIView()
    private let purpleView = UIView()
    
    
    private func setLayout() {
        redView.backgroundColor = .red
        orangeView.backgroundColor = .orange
        yellowView.backgroundColor = .yellow
        greenView.backgroundColor = UIColor(red: 0, green: 0.5, blue: 0, alpha: 1)
        blueView.backgroundColor = .blue
        purpleView.backgroundColor = .purple
        
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [redView, orangeView, yellowView, greenView, blueView, purpleView].forEach {
            contentView.addSubview($0)
        }
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.edges.width.equalTo(scrollView)
            $0.height.greaterThanOrEqualToSuperview().priority(.low)
        }
        
        redView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.height.equalTo(337)
            $0.width.equalTo(UIScreen.main.bounds.width/2)
        }
        
        orangeView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(redView)
            $0.width.equalTo(redView)
        }
        
        yellowView.snp.makeConstraints {
            $0.top.equalTo(redView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.height.equalTo(redView)
            $0.width.equalTo(redView)
        }
        
        greenView.snp.makeConstraints {
            $0.top.equalTo(orangeView.snp.bottom)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(redView)
            $0.width.equalTo(redView)
        }
        
        blueView.snp.makeConstraints {
            $0.top.equalTo(yellowView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.height.equalTo(redView)
            $0.width.equalTo(redView)
        }
        
        purpleView.snp.makeConstraints {
            $0.top.equalTo(yellowView.snp.bottom)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(redView)
            $0.width.equalTo(redView)
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
    }


}

