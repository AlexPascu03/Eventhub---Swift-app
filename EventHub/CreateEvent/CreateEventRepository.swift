//
//  CreateEventRepository.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 30.11.2022.
//

import Foundation
import Firebase
import FirebaseStorage
import SwiftUI

protocol CreateEventRepositoryProtocol {
    func addEventToDb(userID: String, name: String, location: String, description: String, date: Date, image: UIImage?, participants: String, onResponse: @escaping(Result<Void, Error>) -> Void) -> Void
}

final class CreateEventRepository: CreateEventRepositoryProtocol {
    func addEventToDb(userID: String, name: String, location: String, description: String, date: Date, image: UIImage?, participants: String, onResponse: @escaping(Result<Void, Error>) -> Void) -> Void {
        self.addToStorage(image: image ?? UIImage()) { result in
            switch result {
            case .success(let url):
                let db = Firestore.firestore()
                let ref = db.collection("events").document()
                let userId = Auth.auth().currentUser!.uid
                ref.setData(["userId": userId ,"name": name, "location": location, "description": description, "date": date, "participants": Int(participants) ?? 0, "imageURL": url.absoluteString]) {error in
                    if let error = error {
                        onResponse(.failure(error))
                    }else {
                        onResponse(.success(()))
                    }
                }
            case .failure(let error):
                onResponse(.failure(error))
            }
        }
    }
    
    func addToStorage(image: UIImage, onResponse: @escaping(Result<URL, Error>) -> Void) -> Void{
        let ref = Storage.storage().reference()
        let imageData = image.jpegData(compressionQuality: 0.8)
        if let data = imageData {
            let fileRef = ref.child("images/\(UUID().uuidString).jpg")
            let uploadTask = fileRef.putData(data) { metadata, err in
                if let err = err {
                    print(err)
                    return
                }
                fileRef.downloadURL{ url, err in
                    if let url = url {
                        onResponse(.success(url))
                    } else {
                        onResponse(.failure(err!))
                    }
                }
            }
        } else {
            return
        }
    }
}

