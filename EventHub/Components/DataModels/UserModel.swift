//
//  UserModel.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 14.12.2022.
//

import Foundation

import FirebaseFirestoreSwift

struct UserModel: Identifiable, Decodable {
    @DocumentID var id: String?
    var name: String
    var email: String
}
