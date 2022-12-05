//
//  CreateEventNavigation.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 30.11.2022.
//


import Foundation

protocol CreateEventNavigationProtocol {
    var onGoToMainPage: (() -> Void)? { get set }
}

struct CreateEventNavigation: CreateEventNavigationProtocol {
    var onGoToMainPage: (() -> Void)?
}
