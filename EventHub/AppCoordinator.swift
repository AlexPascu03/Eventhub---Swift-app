//
//  AppCoordinator.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 22.11.2022.
//

import UIKit

final class AppCoordinator{
    let window: UIWindow
    let navController: UINavigationController
    var registerCoordinator: RegisterCoordinator?
    
    
    init(scene: UIWindowScene) {
        window = UIWindow(windowScene: scene)
        self.navController = UINavigationController()
        window.rootViewController = navController
        window.makeKeyAndVisible()
    }
    
    func start(){
        let isLogged = false
        
        if isLogged{
            print("is logged")
        }else{
            registerCoordinator = RegisterCoordinator(navController: navController)
            registerCoordinator?.start()
        }
    }
}
