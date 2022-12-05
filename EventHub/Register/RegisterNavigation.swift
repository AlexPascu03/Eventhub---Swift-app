//
//  RegisterNavigation.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 22.11.2022.
//

import Foundation

protocol RegisterNavigationProtocol {
    var onGoToSignIn: (() -> Void)? { get set}
}

struct RegisterNavigation: RegisterNavigationProtocol {
    var onGoToSignIn: (() -> Void)?
}
