//
//  AirportAPIRouter.swift
//  RxSwift+MVVM-C Practice
//
//  Created by yeonBlue on 2021/12/26.
//

import Foundation
import Alamofire

enum AirportAPIRouter {
    case getAirports
}

extension AirportAPIRouter: APIRouter {
    var baseURL: String {
        return "https://gist.githubusercontent.com/tdreyno/4278655/raw/7b0762c09b519f40397e4c3e100b097d861f5588"
    }
    
    var path: String {
        switch self {
        case .getAirports:
            return "airports.json"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getAirports:
            return .get
        }
    }
}
