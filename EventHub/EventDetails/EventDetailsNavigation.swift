//
//  EventDetailsNavigation.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 08.12.2022.
//

import Foundation

protocol EventDetailsNavigationProtocol {
    var onGoToMainPage: (() -> Void)? { get set }
    var onGoToDetails: ((String) -> Void)? { get set }
}

struct EventDetailsNavigation: EventDetailsNavigationProtocol {
    var onGoToMainPage: (() -> Void)?
    var onGoToDetails: ((String) -> Void)?
}
