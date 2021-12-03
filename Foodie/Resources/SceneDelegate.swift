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
        
        let vc: UIViewController
        
        let nVC = ViewController()
        nVC.navigationItem.largeTitleDisplayMode = .always
        
        let navVC = UINavigationController(rootViewController: nVC)
        navVC.navigationBar.prefersLargeTitles = true
        
        vc = navVC
        
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        self.window = window
    }
    
}

