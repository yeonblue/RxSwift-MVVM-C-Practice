//
//  SearchCityCoordinator.swift
//  RxSwift+MVVM-C Practice
//
//  Created by yeonBlue on 2021/12/26.
//

import UIKit
import RxSwift
import RxCocoa

class SearchCityCoordinator: BaseCoordinator {
    
    private let navigationController: UINavigationController
    private let disposeBag = DisposeBag()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let view = SearchAirportViewController.instantiate()
        let service = AirportService.shared
        view.viewModelBuilder = { [disposeBag] in
            let viewModel = SearchAirportViewModel(input: $0, airportService: service)
            
            viewModel.router.citySelected.map ({ [weak self] models in
                guard let self = self else { return }
                
                // router로 이벤트가 오면 화면 이동
                self.showAirport(model: models)
            })
            .drive()
            .disposed(by: disposeBag)
            return viewModel
        }
        
        navigationController.pushViewController(view, animated: true)
    }
}


extension SearchCityCoordinator {
    func showAirport(model: Set<AirportModel>) {
        let airportCoordinator = AirportCoordiator(navigationController: self.navigationController)
        self.add(coordiator: airportCoordinator)
        
        airportCoordinator.start()
    }
}
