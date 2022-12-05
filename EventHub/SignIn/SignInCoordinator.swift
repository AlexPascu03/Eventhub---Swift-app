//
//  SignInCoordinator.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 22.11.2022.
//

import UIKit
import SwiftUI

final class SignInCoordinator {
    let navController: UINavigationController
    var registerCoordinator: RegisterCoordinator?
    var mainPageCoordinator: MainPageCoordinator?
    
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    func start() {
        let repository = SignInRepository()
        var navigation = SignInNavigation()
        
        navigation.onGoToRegister = { [ weak self ] in
            self?.onGoToRegister()
        }
        
        navigation.onGoToMainPage = { [weak self] in
            self?.onGoToMainPage()
        }

        let viewModel = SignInViewModel(repository: repository, navigation: navigation)
        let view = SignInView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)
        navController.isNavigationBarHidden = true
        navController.pushViewController(viewController, animated: true)
    }
    
    func onGoToRegister() {
        registerCoordinator = RegisterCoordinator(navController: navController)
        registerCoordinator?.start()
    }
    
    func onGoToMainPage() {
        mainPageCoordinator = MainPageCoordinator(navController: navController)
        mainPageCoordinator?.start()
    }
}
