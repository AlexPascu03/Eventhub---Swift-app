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
    
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    func start() {
        let repository = RegisterRepository()
        var navigation = RegisterNavigation()
        
        navigation.onClose = { [weak self] in
            self?.navController.popViewController(animated: true)
            print("Should Close Register")
        }
        
        let viewModel = RegisterViewModel(repository: repository, navigation: navigation)
        let view = RegisterView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)
        
        
        navController.pushViewController(viewController, animated: true)
    }
}
