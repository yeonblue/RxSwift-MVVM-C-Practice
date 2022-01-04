//
//  CityViewModel.swift
//  RxSwift+MVVM-C Practice
//
//  Created by yeonBlue on 2022/01/04.
//

import Foundation
import RxCocoa
import RxDataSources
import RxSwift

typealias CityItemsSection = SectionModel<Int, CityViewPresentable>

protocol CityViewPresentable {
    var city: String { get }
    var location: String { get }
}

struct CityViewModel: CityViewPresentable {
    var city: String
    var location: String
}

extension CityViewModel {
    init(model: AirportModel) {
        self.city = model.city
        self.location = "\(model.state ?? ""), \(model.country)"
    }
}

extension CityViewModel: Equatable, Hashable {
    static func == (lhs: CityViewModel, rhs: CityViewModel) -> Bool {
        return lhs.city == rhs.city
    }
    
    // Struct의 경우 모든 인자가 Hashable이거나 직접 구현을 해줘야 문제가 발생하지 않음
    func hash(into hasher: inout Hasher) {
        hasher.combine(city)
    }
}
