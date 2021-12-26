//
//  SceneDelegate.swift
//  RxSwift+MVVM-C Practice
//
//  Created by yeonBlue on 2021/12/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)

        AppCoordinator(window: self.window!).start()
    }
}

