//
//  AirportAPI.swift
//  RxSwift+MVVM-C Practice
//
//  Created by yeonBlue on 2021/12/26.
//

import Foundation
import RxSwift

protocol AirportAPI {
    func fetchAirports() -> Void
}
