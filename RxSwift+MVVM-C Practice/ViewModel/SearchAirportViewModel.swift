//
//  SearchAirportViewModel.swift
//  RxSwift+MVVM-C Practice
//
//  Created by yeonBlue on 2021/12/25.
//

import Foundation
import RxCocoa
import RxSwift
import RxRelay
import RxDataSources

protocol SearchCityViewPresentable {
    typealias Input  = (
        searchText: Driver<String>, ()
    )
    typealias Output = (
        cities: Driver<[CityItemsSection]>, ()
    )
    
    typealias ViewModelBuilder = (SearchCityViewPresentable.Input) -> SearchCityViewPresentable
    
    var input: SearchCityViewPresentable.Input { get }
    var output: SearchCityViewPresentable.Output { get }
}

class SearchAirportViewModel: SearchCityViewPresentable {
    
    var input: SearchCityViewPresentable.Input
    var output: SearchCityViewPresentable.Output
    
    private let airportService: AirportAPI
    private let disposeBag = DisposeBag()
    
    typealias State = (airports: BehaviorRelay<Set<AirportModel>>, ())
    private var state: State = (airports: BehaviorRelay<Set<AirportModel>>(value: []), () )
    
    init(input: SearchCityViewPresentable.Input,
         airportService: AirportAPI) {
        self.input = input
        self.output = SearchAirportViewModel.output(input: self.input,
                                                    state: self.state)
        self.airportService = airportService
        self.process()
    }
}

private extension SearchAirportViewModel {
    static func output(input: SearchCityViewPresentable.Input,
                       state: State) -> SearchCityViewPresentable.Output {
        
        let searchTextObservable = input
            .searchText
            .debounce(.milliseconds(300))
            .distinctUntilChanged()
            .skip(1)
            .asObservable()
            .share(replay: 1, scope: .whileConnected) // API를 호출할 때는 중복 호출 방지
        
        let airportsObserVable = state.airports.skip(1).asObservable()
        
        let sections = Observable
            .combineLatest(searchTextObservable, airportsObserVable)
            .map { (searchKey, airports) in
                return airports.filter { (airport) in
                    !searchKey.isEmpty &&
                    airport.city.lowercased()
                        .replacingOccurrences(of: " ", with: "")
                        .hasPrefix(searchKey.lowercased())
                }
            }
            .map { uniqueElementsFrom(array: $0.compactMap({ model in
                CityViewModel(model: model)
            }))}
            .map({
                // Section이 1개므로 0으로 임시 설정
                [CityItemsSection(model: 0, items: $0)]
            })
            .asDriver(onErrorJustReturn: [])

        return (
            cities: sections, ()
        )
    }
    
    func process() -> Void {
        self.airportService
            .fetchAirports()
            .map({ Set($0) })
            .map({ [state] in
                state.airports.accept($0)
            })
            .subscribe()
            .disposed(by: self.disposeBag)
    }
}

// MARK: - Helpers
private extension SearchAirportViewModel {
    static func uniqueElementsFrom(array: [CityViewModel]) -> [CityViewModel] {
        var set = Set<CityViewModel>()
        
        let result = array.filter { model in
            guard !set.contains(model) else {
                return false
            }
            
            set.insert(model)
            return true
        }
        
        return result
    }
}
