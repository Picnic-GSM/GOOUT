//
//  API.swift
//  GOOUT
//
//  Created by 조주혁 on 2021/09/16.
//

import Alamofire
import UIKit

enum APIError<T> {
    case success(Data)
    case networkError(T)
}

class API {
    static let shared: API = API()
    
    func get(url: String, header: HTTPHeaders, parameter: Parameters, completion: @escaping (APIError<Any>) -> Void) {
        AF.request("\(Config.baseURL)\(url)", parameters: parameter, headers: header).responseJSON { response in
            switch response.result {
            case .success(let value):
                print(value)
                guard let data = response.data else { return }
                completion(.success(data))
            case .failure(let error):
                print(error.localizedDescription)
                completion(.networkError(error.localizedDescription))
            }
        }
    }
}
