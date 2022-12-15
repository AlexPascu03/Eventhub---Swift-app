//
//  CreateEventCoordinator.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 30.11.2022.
//
import UIKit
import SwiftUI
import Firebase


final class CreateEventCoordinator {
    let navController: UINavigationController
    var mainPageCoordinator: MainPageCoordinator?
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    func start(){
        let repository = CreateEventRepository()
        var navigation = CreateEventNavigation()
        navigation.onGoToMainPage = { [weak self] in
            self?.navController.popViewController(animated: true)
        }
        let viewModel = CreateEventViewModel(repository: repository, navigation: navigation)
        let view = CreateEventView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)
        navController.isNavigationBarHidden = true
        navController.pushViewController(viewController, animated: true)
    }
    
    func onGoToMainPage() {
        mainPageCoordinator = MainPageCoordinator(navController: navController)
        mainPageCoordinator?.start()
    }
}
