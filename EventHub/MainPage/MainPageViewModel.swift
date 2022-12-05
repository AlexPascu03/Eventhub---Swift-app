//
//  MainPageModelView.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 28.11.2022.
//

import Foundation
import UIKit

protocol MainPageViewModelProtocol: ObservableObject {
    func goToCreate()
}

final class MainPageViewModel: MainPageViewModelProtocol {
    let repository: MainPageRepositoryProtocol
    let navigation: MainPageNavigationProtocol

    init(repository: MainPageRepositoryProtocol, navigation: MainPageNavigationProtocol) {
        self.repository = repository
        self.navigation = navigation
    }
    
    func goToCreate(){
        navigation.onGoToCreate?()
        print("csa")
    }
    
}

