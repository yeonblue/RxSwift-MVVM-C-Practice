//
//  SearchCityCoordinator.swift
//  RxSwift+MVVM-C Practice
//
//  Created by yeonBlue on 2021/12/26.
//

import UIKit

class SearchCityCoordinator: BaseCoordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let view = SearchAirportViewController.instantiate()
        let service = AirportService.shared
        view.viewModelBuilder = {
            SearchAirportViewModel(input: $0, airportService: service)
            
        }
        
        navigationController.pushViewController(view, animated: true)
    }
}
