//
//  AirportService.swift
//  RxSwift+MVVM-C Practice
//
//  Created by yeonBlue on 2021/12/26.
//

import Foundation
import Alamofire
import RxSwift

class AirportService {
    private lazy var apiService = AirportAPIService()
    static let shared: AirportService = AirportService()
}

extension AirportService: AirportAPI {
    func fetchAirports() -> Single<AirportsResponses> {
        return Single<AirportsResponses>.create { single in
            
            do {
                try AirportAPIRouter
                    .getAirports
                    .request(usingHTTPService: self.apiService)
                    .responseJSON { result in
                        do {
                            let airports = try AirportService.parseAirports(result: result)
                            single(.success(airports))                            
                        } catch {
                            single(.error(error))
                        }
                    }
                
            } catch {
                single(.error(CustomError.error(message: "Airports fetch error")))
            }

            return Disposables.create()
        }
    }
}

extension AirportService {
    static func parseAirports(result: AFDataResponse<Any>) throws -> AirportsResponses {
        
        guard let data = result.data,
              let airportsResponse = try? JSONDecoder().decode(AirportsResponses.self,
                                                              from: data) else {
                  throw CustomError.error(message: "Invalid Airports JSON")
              }
        return airportsResponse
    }
}
