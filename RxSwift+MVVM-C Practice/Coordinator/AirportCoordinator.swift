//
//  AirportCoordinator.swift
//  RxSwift+MVVM-C Practice
//
//  Created by yeonBlue on 2022/01/08.
//

import UIKit
import RxSwift
import RxCocoa

class AirportCoordiator: BaseCoordinator {
    
    private let navigationController: UINavigationController
    private let disposeBag = DisposeBag()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let vc = AirportViewController.instantiate()
        navigationController.pushViewController(vc, animated: true)
    }
}
