//
//  RegisterCoordinator.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 22.11.2022.
//
import SwiftUI
import UIKit

final class RegisterCoordinator {
    let navController: UINavigationController
    var signInCoordinator: SignInCoordinator?
    
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    func start() {
        let repository = RegisterRepository()
        var navigation = RegisterNavigation()
        navigation.onGoToSignIn = { [weak self] in
            self?.navController.popViewController(animated: true)
        }
        let viewModel = RegisterViewModel(repository: repository, navigation: navigation)
        let view = RegisterView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)
        navController.isNavigationBarHidden = true
        navController.pushViewController(viewController, animated: true)
    }
    
    func onGoToSignIn() {
        signInCoordinator = SignInCoordinator(navController: navController)
        signInCoordinator?.start()

    }
}
