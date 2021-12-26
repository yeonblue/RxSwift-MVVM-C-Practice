//
//  APIRouter.swift
//  RxSwift+MVVM-C Practice
//
//  Created by yeonBlue on 2021/12/26.
//

import UIKit
import Alamofire

protocol APIRouter {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var parameters: Parameters? { get }
    func body() throws -> Data?
    
    func request(usingHTTPService service: APIService) throws -> DataRequest
}

extension APIRouter {
    var parameters: Parameters? { return nil }
    var headers: HTTPHeaders? { return nil }
    func body() throws -> Data? { return nil }
    
    func asURLRequest() throws -> URLRequest {
        var url = try baseURL.asURL()
        url.appendPathComponent(path)
        
        var request = try URLRequest(url: url, method: method, headers: headers)
        request.httpBody = try body()
        
        return request
    }
    
    func request(usingHTTPService service: APIService) throws -> DataRequest {
        return try service.request(asURLRequest())
    }
}
