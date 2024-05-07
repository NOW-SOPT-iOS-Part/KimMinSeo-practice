//
//  SignUpRequestModel.swift
//  34th-Sopt-Seminar
//
//  Created by 김민서 on 4/27/24.
//

import Foundation
//요청 모델 만들기
struct SignUpRequestModel: Codable {
    let authenticationId: String
    let password: String
    let nickname: String
    let phone: String
}
