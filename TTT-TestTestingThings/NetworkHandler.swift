//
//  NetworkHandler.swift
//  TTT-TestTestingThings
//
//  Created by KyungYoung Heo on 2021/12/03.
//

import Foundation
import Alamofire
import UIKit

class NetworkHandler {
    class func requestRandomList(completion: @escaping (Result<[RandomPicDataModel], Error>) -> Void) {
        
        AF.request("https://picsum.photos/v2/list", method: .get)
        .response { response in
            switch response.result {
            case .success(let data):
                let decoder = JSONDecoder()
                
                guard let data = data,
                    let decodedData = try? decoder.decode([RandomPicDataModel].self, from: data) else {
                    completion(.failure(NetworkError.JSONParseError))
                    return
                }
                completion(.success(decodedData))
            case .failure(let error):
                print(error)
                completion(.failure(NetworkError.InvalidResponse))
            }
        }
    }
    
    class func requestRandomPic(id: Int, completion: @escaping (Result<UIImage, Error>) -> Void) {
        AF.request("https://picsum.photos/id/\(id)/300/300", method: .get)
            .response { response in
                switch response.result {
                case .success(let data):
                    let decoder = JSONDecoder()
                    
                    guard let data = data,
                          let image = UIImage(data: data) else {
                        completion(.failure(NetworkError.JSONParseError))
                        return
                    }
                    completion(.success(image))
                case .failure(let error):
                    print(error)
                    completion(.failure(NetworkError.InvalidResponse))
                }
            }
    }
}
