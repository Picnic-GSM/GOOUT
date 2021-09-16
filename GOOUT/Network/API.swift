//
//  API.swift
//  GOOUT
//
//  Created by 조주혁 on 2021/09/16.
//

import Alamofire
import UIKit

enum APIResult<T> {
    case success(T) // 성공
    case invalidURL // 잘못된 URL
    case requsestError(T) // 잘못된 Parameter
    case networkError // 네트워크 에러
    case tokenError // 토큰 만료
    case authorityError // 권한 없음
}

class API {
    static let shared: API = API() // 싱글톤 패턴
    
    func request(url: String, method: HTTPMethod, parameter: [String: Any]? = nil, completion: @escaping (APIResult<Any>) -> Void) {
        // TokenManager 만들어서 Token 있으면 header에 넣고, 없으면 [ : ] 이렇게 보냄
        var header: HTTPHeaders = [ : ]
        AF.request("\(Config.baseURL)\(url)",method: method, parameters: parameter, encoding: JSONEncoding.default, headers: header).responseJSON { response in
            switch response.result {
            case .success(let value):
                print(value)
                guard let data = response.data else { return }
                guard let status = response.response?.statusCode else { return }
                let networkResult = self.statusFilter(data: data, status: status)
                completion(.success(networkResult))
            case .failure(let error):
                print(error.localizedDescription)
                completion(.networkError)
            }
        }
    }
    
    // status에 따른 결과
    private func statusFilter(data: Data, status: Int) -> APIResult<Any> {
        switch status {
        case 200, 201:
            return .success(data)
        case 204, 400, 500:
            return .requsestError(data)
        case 404:
            return .invalidURL
        case 401:
            return .tokenError
        case 403:
            return .authorityError
        default:
            return .requsestError(data)
        }
    }
}


