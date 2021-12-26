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
        return "https://gist.githubusercontent.com/tdreyno"
    }
    
    var path: String {
        switch self {
        case .getAirports:
            return "4278655/raw"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getAirports:
            return .get
        }
    }
}
