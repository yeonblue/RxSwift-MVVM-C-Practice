//
//  SearchAirportViewModel.swift
//  RxSwift+MVVM-C Practice
//
//  Created by yeonBlue on 2021/12/25.
//

import Foundation
import RxCocoa

protocol SearchCityViewPresentable {
    typealias Input  = (
        searchText: Driver<String>, ()
    )
    typealias Output = ()
    
    var input: SearchCityViewPresentable.Input { get }
    var output: SearchCityViewPresentable.Output { get }
}

class SearchAirportViewModel: SearchCityViewPresentable {
    
    var input: SearchCityViewPresentable.Input
    var output: SearchCityViewPresentable.Output
    
    init(input: SearchCityViewPresentable.Input) {
        self.input = input
        self.output = SearchAirportViewModel.output(input: self.input)
    }
}

private extension SearchAirportViewModel {
    static func output(input: SearchCityViewPresentable.Input) -> SearchCityViewPresentable.Output {
        return ()
    }
}
