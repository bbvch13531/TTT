//
//  NetworkElements.swift
//  TTT-TestTestingThings
//
//  Created by KyungYoung Heo on 2021/12/03.
//

import Foundation

enum NetworkError: Error {
    case WrongURL
    case InvalidResponse
    case JSONParseError
}

struct ApplicationKey {
    static let apiKey = "Bearer eyJhbGciOiJIUzUxMiJ9.eyJ1c2VySWQiOiIzMGEwODljMi1lYTkzLTQ1MzItODc0NC00MTlmNGQ0ZjhhMzciLCJhY2Nlc3NUb2tlbklkIjoiMGZlNTQwNjYtNmZmMS00ODM2LThkMWUtZjExOTMxNTA4ZTUxIiwiaWF0IjoxNjM4MzI1NzQzLCJleHAiOjE2Mzg0MTIxNDN9.lFzi4JL6ayxVGGthgeZv7YmFACVTZXWarmWGmvCh3i_Xt16P2-InNpgURb7OUY2wXIGIoOABlanUhuw4iO1pmA"
    static let pVersion = "2.10.0+102"
    static let pVendor = "Test"
    static let pPlatform = "IOS"
}

struct HeaderField {
    static let authorization = "Authorization"
    static let pVersion = "P-Version"
    static let pVendor = "P-Vendor"
    static let pPlatform = "P-Platform"
}
