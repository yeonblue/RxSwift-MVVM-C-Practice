//
//  BaseCoordinator.swift
//  RxSwift+MVVM-C Practice
//
//  Created by yeonBlue on 2021/12/26.
//

import Foundation

class BaseCoordinator: Coordiator {
    var childCoordinator: [Coordiator] = []
    func start() {
        fatalError("child should implemnet start function")
    }
}
