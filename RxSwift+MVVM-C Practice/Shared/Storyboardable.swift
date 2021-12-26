//
//  Storyboardable.swift
//  RxSwift+MVVM-C Practice
//
//  Created by yeonBlue on 2021/12/26.
//

import UIKit

protocol Storyboardable {
    static func instantiate(storyBoardName: String) -> Self
}

extension Storyboardable where Self: UIViewController {
    static func instantiate(storyBoardName: String = "Main") -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let storyBoard = UIStoryboard(name: storyBoardName, bundle: nil)
        return storyBoard.instantiateViewController(identifier: className)
    }
}
