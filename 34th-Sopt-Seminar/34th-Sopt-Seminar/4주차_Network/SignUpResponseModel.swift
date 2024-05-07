//
//  SignUpResponseModel.swift
//  34th-Sopt-Seminar
//
//  Created by 김민서 on 4/27/24.
//

import Foundation

//요청을 했으니까 응답도 받아야겠죠? 응답 모델도 만들어 줍니다~
struct SignUpResponseModel: Codable {
    let code: Int // ex) 400
    let message: String //ex) 이미 존재하는 ID입니다
}
