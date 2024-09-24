//
//  SceneDelegate.swift
//  ToDos
//
//  Created by Artur Akulich on 21.09.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var navigationVC: UINavigationController?
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        let mainViewController = MainBuilder.build()
        self.navigationVC = UINavigationController(rootViewController: mainViewController)
        self.window?.rootViewController = self.navigationVC
        self.window?.makeKeyAndVisible()
    }
}

