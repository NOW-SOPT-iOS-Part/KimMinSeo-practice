//
//  UserService.swift
//  34th-Sopt-Seminar
//
//  Created by 김민서 on 4/27/24.
//

import Foundation

import Moya

final class UserService {
    static let shared = UserService()
    private var userProvider = MoyaProvider<UserTargetType>(plugins: [MoyaLoggingPlugin()])
    
    private init() {}
}

extension UserService {
    func getUserInfo(memberId: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        userProvider.request(.getUserInfo(memberId: memberId)) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                
                let networkResult = self.judgeStatus(by: statusCode, data, UserInfoResponseModel.self)
                completion(networkResult)
                
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    
    func signUp(request: SignUpRequestModel, completion: @escaping (NetworkResult<Any>) -> Void) {
        userProvider.request(.signUp(request: request)) { result in
            switch result {
            //성공
            case .success(let response):
                print("🫶 memberID는 \(String(describing: response.response?.allHeaderFields["Location"]))")
                
                let statusCode = response.statusCode
                let data = response.data
                
                let networkResult = self.judgeStatus(by: statusCode, data, SignUpResponseModel.self)
                completion(networkResult)
            //개가티 실패...
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    
    
    //네트워크 응답이 온 경우에 다시 판별하기
    public func judgeStatus<T: Codable>(by statusCode: Int, _ data: Data, _ object: T.Type) -> NetworkResult<Any> {
        
        switch statusCode {
        case 200..<205:
            return isValidData(data: data, T.self)
        case 400..<500:
            return .requestErr
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
    
    //status까지도 성공이면 디코딩(클라에서 쓸 수 있게 JSON형식으로 바꿔주는 것)도 처리
    private func isValidData<T: Codable>(data: Data, _ object: T.Type) -> NetworkResult<Any> {
        let decoder = JSONDecoder()//JSON 디코더 사용해서 바꿔주기
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            print("⛔️ \(self)애서 디코딩 오류가 발생했습니다 ⛔️")
            return .pathErr }
        
        return .success(decodedData as Any)
    }
}

