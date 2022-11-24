//
//  RegisterNavigation.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 22.11.2022.
//

import Foundation

protocol RegisterNavigationProtocol {
    var onClose: (() -> Void)? { get set}
    var onGoToSignUp: (() -> Void)? { get set}
}

struct RegisterNavigation: RegisterNavigationProtocol {
    var onClose: (() -> Void)?
    var onGoToSignUp: (() -> Void)?
}
