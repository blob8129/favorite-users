//
//  SceneDelegate.swift
//  FavoriteUsers
//
//  Created by Andrey Volobuev on 21/07/2021.
//

import UIKit


class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    private lazy var loginStateStorage = PersistentStorage<LoginState>(
        storageKey: "LoginStateStorageKey"
    )
    
    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {

        guard let scene = (scene as? UIWindowScene) else {
            return
        }
        window = UIWindow(windowScene: scene)
        window?.windowScene = scene
        
        let loginState = loginStateStorage.load() ?? .loggedOut
        switch loginState {
        case .loggedIn(token: let token):
            break
        case .loggedOut:
            let veiwController = LoginViewController()
            window?.rootViewController = veiwController
        }
        
        
        window?.makeKeyAndVisible()
    }
}
