//
//  SiginInNavigation.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 22.11.2022.
//

import Foundation

protocol SignInNavigationProtocol {
    var onGoToRegister: (() -> Void)? { get set }
    var onGoToMainPage: (() -> Void)? { get set }
}

struct SignInNavigation: SignInNavigationProtocol {
    var onGoToRegister: (() -> Void)?
    var onGoToMainPage: (() -> Void)? 

}
