//
//  CardModel.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 06.12.2022.
//

import Foundation
import FirebaseFirestoreSwift

struct EventModel: Identifiable, Decodable {
    @DocumentID var id: String?
    var name: String
    var date: Date 
    var description: String
    var imageURL: String
    var location: String
    var participants: Int
    var userId: String
}
