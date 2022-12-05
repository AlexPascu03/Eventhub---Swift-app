//
//  SignInRepository.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 22.11.2022.
//

import Foundation
import FirebaseAuth

protocol SignInRepositoryProtocol {
    func loginUser(email: String, password: String, onResponse: @escaping(Result<Void, Error>) -> Void) -> Void 
}

final class SignInRepository: SignInRepositoryProtocol {
    func loginUser(email: String, password: String, onResponse: @escaping(Result<Void, Error>) -> Void) -> Void {
        Auth.auth().signIn(withEmail: email, password: password) {result, error in
            if let error = error {
                onResponse(.failure(error))
            } else {
                onResponse(.success(()))
                _ = result!.user.uid
            }
        }
    }
}
