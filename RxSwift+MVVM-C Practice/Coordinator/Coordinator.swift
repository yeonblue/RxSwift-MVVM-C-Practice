//
//  Coordinator.swift
//  RxSwift+MVVM-C Practice
//
//  Created by yeonBlue on 2021/12/26.
//

import Foundation

protocol Coordiator: AnyObject {
    var childCoordinator: [Coordiator] { get set }
    func start()
}

extension Coordiator {
    func add(coordiator: Coordiator) -> Void {
        childCoordinator.append(coordiator)
    }
    
    func remove(coordinator: Coordiator) {
        childCoordinator = childCoordinator.filter({ $0 !== coordinator })
    }
}
