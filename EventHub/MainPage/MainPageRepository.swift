//
//  MainPageRepository.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 28.11.2022.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


protocol MainPageRepositoryProtocol {
    func getThisWeekEvents() async throws -> [EventModel]
    func getCloseEvents() async throws -> [EventModel]
    func getPopularEvents() async throws -> [EventModel]
    func getRandomEvent() async throws -> [EventModel]
}

final class MainPageRepository: MainPageRepositoryProtocol {
    let db = Firestore.firestore()

    func getThisWeekEvents() async throws -> [EventModel]{
        
        do {
            let snapshot = try await db.collection("events").whereField("date", isLessThan: Date() + 60*60*24*7).limit(to: 10).getDocuments()
            let events = snapshot.documents.compactMap{ try? $0.data(as: EventModel.self)}
            return events
        } catch {
            throw error
        }        
    }
    
    func getCloseEvents() async throws -> [EventModel] {
        do {
            let snapshot = try await db.collection("events").whereField("location", isEqualTo: "Oradea, Romania").getDocuments()
            let events = snapshot.documents.compactMap{ try? $0.data(as: EventModel.self)}
            return events
        } catch {
            throw error
        }
    }
    
    func getPopularEvents() async throws -> [EventModel] {
        do {
            let snapshot = try await db.collection("events").order(by: "participants", descending: true).getDocuments()
            let events = snapshot.documents.compactMap{ try? $0.data(as: EventModel.self)}
            return events
        } catch {
            throw error
        }
    }
    
    func getRandomEvent() async throws -> [EventModel] {
        do {
            let snapshot = try await
            db.collection("events").limit(to: 1).getDocuments()
            let events = snapshot.documents.compactMap{try? $0.data(as: EventModel.self)}
            return events
        } catch {
            throw error
        }
    }
}



