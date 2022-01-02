//
//  SearchAirportViewModel.swift
//  RxSwift+MVVM-C Practice
//
//  Created by yeonBlue on 2021/12/25.
//

import Foundation
import RxCocoa
import RxSwift

protocol SearchCityViewPresentable {
    typealias Input  = (
        searchText: Driver<String>, ()
    )
    typealias Output = ()
    typealias ViewModelBuilder = (SearchCityViewPresentable.Input) -> SearchCityViewPresentable
    
    var input: SearchCityViewPresentable.Input { get }
    var output: SearchCityViewPresentable.Output { get }
}

class SearchAirportViewModel: SearchCityViewPresentable {
    
    var input: SearchCityViewPresentable.Input
    var output: SearchCityViewPresentable.Output
    
    private let airportService: AirportAPI
    private let disposeBag = DisposeBag()
    
    init(input: SearchCityViewPresentable.Input,
         airportService: AirportAPI) {
        self.input = input
        self.output = SearchAirportViewModel.output(input: self.input)
        self.airportService = airportService
        self.process()
    }
}

private extension SearchAirportViewModel {
    static func output(input: SearchCityViewPresentable.Input) -> SearchCityViewPresentable.Output {
        return ()
    }
    
    func process() -> Void {
        self.airportService
            .fetchAirports()
            .map({ airports in
                print("fetch airport: \(airports)")
            })
            .subscribe()
            .disposed(by: self.disposeBag)
    }
}
