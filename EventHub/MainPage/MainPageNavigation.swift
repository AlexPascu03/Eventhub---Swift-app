//
//  MainPageNavigation.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 28.11.2022.
//

import Foundation

protocol MainPageNavigationProtocol {
    var onGoToCreate: (() -> Void)? { get set }
}

struct MainPageNavigation: MainPageNavigationProtocol{
    var onGoToCreate: (() -> Void)?
}
