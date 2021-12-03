//
//  ResponseDataModel.swift
//  TTT-TestTestingThings
//
//  Created by KyungYoung Heo on 2021/12/03.
//
import Foundation

protocol ResponseDataType {
    
}

struct ResponseDataModel: ResponseDataType, Codable {
    
}

struct RandomPicDataModel: Codable {
    var id: String
    var author: String
    var width: Int
    var height: Int
    var url: String
    var download_url:String
}

struct ContentDataModel: Codable {
    var id: String
    var title: String
    var info: String
    var thumbnailImageURL: String
}
