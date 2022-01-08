//
//  SelectAirportViewModel.swift
//  RxSwift+MVVM-C Practice
//
//  Created by yeonBlue on 2022/01/08.
//

import Foundation

protocol SelectAirportViewPresentable {
    var name: String { get }
    var code: String { get }
    var address: String { get }
    var distance: Double { get }
    var formattedDistance: String { get }
    
    var runnwayLength: String { get }
    var location: (lat: String, lon: String) { get }
}

struct SelectAirportViewModel: SelectAirportViewPresentable {
    
    // MARK: - Properties
    var name: String
    var code: String
    var address: String
    var distance: Double
    var formattedDistance: String {
        return "\(distance.rounded(.toNearestOrEven) / 1000) Km"
    }
    
    var runnwayLength: String
    var location: (lat: String, lon: String)
}

extension SelectAirportViewModel {
    
    init(model: AirportModel) {
        self.name = model.name
        self.code = model.code
        self.address = "\(model.state ?? ""), \(model.country)"
        self.runnwayLength = "Runway Length: \(model.runwayLength ?? "NA")"
        // TODO: 거리 추후 수정 필요
        self.location = (lat: model.lat, lon: model.lon)
        self.distance = 0
    }
}
