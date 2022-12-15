//
//  EventDetailsRepository.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 08.12.2022.
//

import Foundation
import Firebase


protocol EventDetailsRepositoryProtocol {
    func getEventDetails(id: String) async throws -> EventModel
    func getUserDetails(userId: String) async throws -> UserModel
    func getRelatedEvents() async throws -> [EventModel]
    
}

final class EventDetailsRepository: EventDetailsRepositoryProtocol {
    
    let db = Firestore.firestore()
    
    func getEventDetails(id: String) async throws -> EventModel{
        do {
            let snapshot = try await db.collection("events").document(id).getDocument().data(as: EventModel.self)
            return snapshot
        } catch {
            throw error
        }
    }
    
    func getUserDetails(userId: String) async throws -> UserModel{
        do {
            let snapshot = try await
            db.collection("users").document(userId).getDocument().data(as: UserModel.self)
            return snapshot
        } catch {
            throw error
        }
    }
    
    func getRelatedEvents() async throws -> [EventModel] {
        do {
            let snapshot = try await db.collection("events").order(by: "participants", descending: true).getDocuments()
            let events = snapshot.documents.compactMap{ try? $0.data(as: EventModel.self)}
            return events
        } catch {
            throw error
        }
    }        
}
