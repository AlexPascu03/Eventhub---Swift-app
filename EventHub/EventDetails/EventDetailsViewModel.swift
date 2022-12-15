//
//  EventDetailsViewModel.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 08.12.2022.
//

import Foundation
protocol EventDetailsViewModelProtocol: ObservableObject {
    func goToMainPage()
    var event: EventModel { get set }
    var user: UserModel { get set }
    var relatedEvents: [EventModel] { get set }
    
    func goToDetails(_ id: String)
    func getRelatedEvents()
}

final class EventDetailsViewModel: EventDetailsViewModelProtocol {
    let repository: EventDetailsRepositoryProtocol
    let navigation: EventDetailsNavigationProtocol
    @Published var event: EventModel = EventModel(name: "", date: Date(), description: "", imageURL: "", location: "", participants: 0, userId: "")
    @Published var user: UserModel = UserModel(name: "", email: "")
    @Published var relatedEvents: [EventModel] = []

    init(repository: EventDetailsRepositoryProtocol, navigation: EventDetailsNavigationProtocol, id: String) {
        self.repository = repository
        self.navigation = navigation
        self.getEventDetails(id: id)
        self.getRelatedEvents()
    }
    
    func goToMainPage() {
        navigation.onGoToMainPage?()
    }
    
    func goToDetails(_ id: String){
        navigation.onGoToDetails?(id)
    }
    
    func getRelatedEvents(){
        Task {@MainActor in
            let result = try await repository.getRelatedEvents()
            relatedEvents = result
        }
    }
    
    func getEventDetails(id: String){
        Task{@MainActor in
            let result = try await repository.getEventDetails(id: id)
                event = result
                let userResult = try await repository.getUserDetails(userId: event.userId)
                user = userResult
            
        }
    }
}
