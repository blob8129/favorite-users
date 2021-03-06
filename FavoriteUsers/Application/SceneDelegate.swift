//
//  SceneDelegate.swift
//  FavoriteUsers
//
//  Created by Andrey Volobuev on 21/07/2021.
//

import UIKit


class SceneDelegate: UIResponder, UIWindowSceneDelegate, LoginDelegate {
    
    var baseURL = URL(string: "http://base_url.stub")!

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
        case .loggedIn(let token):
            window?.rootViewController = UsersAssembler().assemble(baseURL: baseURL, token: token)
        case .loggedOut:
            let veiwController = LoginAssembler().assemble(baseURL: baseURL, delegate: self)
            window?.rootViewController = veiwController
        }
        window?.makeKeyAndVisible()
    }
    
    func didLogInWith(token: String) {
        loginStateStorage.save(item: .loggedIn(token: token))
        window?.rootViewController = UsersAssembler().assemble(baseURL: baseURL, token: token)
    }
}
