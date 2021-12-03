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
    
    class func requestContents(library: String, completion: @escaping (Result<[ContentDataModel], Error>) -> Void) {
        let defaultSession = URLSession(configuration: .default)
        guard var urlComponent = URLComponents(string: "https://staging-api.blimp.space/series?library=" + library),
        let url = urlComponent.url else {
            completion(.failure(NetworkError.WrongURL))
              return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue(ApplicationKey.apiKey, forHTTPHeaderField: HeaderField.authorization)
        urlRequest.addValue(ApplicationKey.pVersion, forHTTPHeaderField: HeaderField.pVersion)
        urlRequest.addValue(ApplicationKey.pVendor, forHTTPHeaderField: HeaderField.pVendor)
        urlRequest.addValue(ApplicationKey.pPlatform, forHTTPHeaderField: HeaderField.pPlatform)
        let dataTask = defaultSession.dataTask(with: urlRequest) { data, response, error in
            if let e = error {
                completion(.failure(e))
                return
            }
            
            guard let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(NetworkError.InvalidResponse))
                return
            }
            
            let decoder = JSONDecoder()
            
            guard let decodedData = try? decoder.decode([ContentDataModel].self, from: data) else {
                completion(.failure(NetworkError.JSONParseError))
                return
            }
            completion(.success(decodedData))
        }
        dataTask.resume()
    }
}
