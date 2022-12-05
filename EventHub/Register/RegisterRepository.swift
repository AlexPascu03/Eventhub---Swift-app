//
//  RegisterRepository.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 22.11.2022.
//

import Foundation
import Firebase
import FirebaseFirestore

protocol RegisterRepositoryProtocol {
    func createUser(fName: String, password: String, email: String, onResponse: @escaping(Result<Void, Error>) -> Void) -> Void
}

final class RegisterRepository: RegisterRepositoryProtocol {
    
    func createUser(fName: String, password: String, email: String, onResponse: @escaping(Result<Void, Error>) -> Void) -> Void {
        Auth.auth().createUser(withEmail: email, password: password) {result, error in
            
            if let error = error {
                onResponse(.failure(error))
            } else {
                let userId = result!.user.uid
                self.addUserToDb(id: userId, fName: fName, email: email) { result in
                    switch result {
                    case .success:
                        onResponse(.success(()))
                    case .failure:
                        onResponse(.failure(error!))
                    }
                }
            }
        }
    }
    
    private func addUserToDb(id: String, fName: String, email: String,onResponse: @escaping(Result<Void, Error>) -> Void) -> Void {
        let db = Firestore.firestore()
        let ref = db.collection("users").document(id)
        ref.setData(["name": fName, "email": email]) {error in
            if let error = error {
                onResponse(.failure(error))
            }else {
                onResponse(.success(()))
            }
        }
    }
}
