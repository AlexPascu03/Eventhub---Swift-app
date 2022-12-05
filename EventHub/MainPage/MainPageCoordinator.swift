//
//  MainPageCoorindator.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 28.11.2022.
//

import Foundation
import UIKit
import SwiftUI

final class MainPageCoordinator {
    let navController: UINavigationController
    var createEventCoordinator: CreateEventCoordinator?
    
    init(navController: UINavigationController) {
        self.navController = navController
    }

    func start() {
        let repository = MainPageRepository()
        var navigation = MainPageNavigation()
        navigation.onGoToCreate = { [weak self] in
            self?.onGoToCreate()
        }
        
        let viewModel = MainPageViewModel(repository: repository, navigation: navigation)
        let view = MainPageView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)
        navController.isNavigationBarHidden = true
        navController.pushViewController(viewController, animated: true)
    }
    
    func onGoToCreate() {
        createEventCoordinator = CreateEventCoordinator(navController: navController)
        createEventCoordinator?.start()
    }
}
