//
//  SceneDelegate.swift
//  Foodie
//
//  Created by Boris Bolshakov on 3.12.21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        
//        window.rootViewController = TabBarViewController()
        window.rootViewController = ViewController()
        window.makeKeyAndVisible()
        self.window = window
    }
    
}

