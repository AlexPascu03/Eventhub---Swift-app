//
//  EventDetailsCoordinator.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 08.12.2022.
//

import UIKit
import SwiftUI
import Firebase

final class EventDetailsCoordinator {
    let navController: UINavigationController
    var mainPageCoordinator: MainPageCoordinator?
    
    init(navController: UINavigationController, mainPageCoordinator: MainPageCoordinator? = nil) {
        self.navController = navController
    }
    
    func start(_ id: String){
        let repository = EventDetailsRepository()
        var navigation = EventDetailsNavigation()
        navigation.onGoToMainPage = { [weak self] in
            self?.navController.popViewController(animated: true)
        }
        navigation.onGoToDetails = { [weak self] id in
            self?.onGoToDetails(id)
        }
        let viewModel = EventDetailsViewModel(repository: repository, navigation: navigation, id: id)
        let view = EventDetailsView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)
        navController.isNavigationBarHidden = true
        navController.pushViewController(viewController, animated: true)
    }
    
    func onGoToMainPage() {
        mainPageCoordinator = MainPageCoordinator(navController: navController)
        mainPageCoordinator?.start()
    }
    
    func onGoToDetails(_ id: String) {
        self.start(id)
    }
}
