//
//  RegisterRepository.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 22.11.2022.
//

import Foundation

protocol RegisterRepositoryProtocol {
    func getUser() -> String
}

final class RegisterRepository: RegisterRepositoryProtocol {
    func getUser() -> String {
        "Alex"
    }
}
