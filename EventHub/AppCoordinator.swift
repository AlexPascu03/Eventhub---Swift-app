//
//  AppCoordinator.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 22.11.2022.
//

import UIKit
import Firebase

final class AppCoordinator{
    let window: UIWindow
    let navController: UINavigationController
    var signInCoordinator: SignInCoordinator?
    var createEventCoordinator: CreateEventCoordinator?
    var mainPageCoordinator: MainPageCoordinator?

    
    
    init(scene: UIWindowScene) {
        window = UIWindow(windowScene: scene)
        self.navController = UINavigationController()
        window.rootViewController = navController
        window.makeKeyAndVisible()
    }
    
    func start(){
        let isLogged = true
        
        if isLogged{
            mainPageCoordinator = MainPageCoordinator(navController: navController)
            mainPageCoordinator?.start()
        } else {
            createEventCoordinator = CreateEventCoordinator(navController: navController)
            createEventCoordinator?.start()
        }
    }
}
