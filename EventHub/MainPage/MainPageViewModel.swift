//
//  MainPageModelView.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 28.11.2022.
//

import Foundation
import Firebase
import UIKit
import FirebaseFirestoreSwift

protocol MainPageViewModelProtocol: ObservableObject {
    var thisWeekEvents: [EventModel] { get set }
    var popularEvents: [EventModel] { get set }
    var closeEvents: [EventModel] { get set }
    var randomEvent: [EventModel] { get set }
    func getThisWeekEvents()
    func getPopularEvents()
    func getCloseEvents()
    func getRandomEvent()
    func goToCreate()
    func goToDetails(_ id: String)
}

final class MainPageViewModel: MainPageViewModelProtocol {
    
    let repository: MainPageRepositoryProtocol
    let navigation: MainPageNavigationProtocol
    
    @Published var cards: [EventModel] = []
    @Published var thisWeekEvents: [EventModel] = []
    @Published var popularEvents: [EventModel] = []
    @Published var closeEvents: [EventModel] = []
    @Published var randomEvent: [EventModel] = []
    
    init(repository: MainPageRepositoryProtocol, navigation: MainPageNavigationProtocol) {
        self.repository = repository
        self.navigation = navigation
        self.getThisWeekEvents()
        self.getPopularEvents()
        self.getCloseEvents()
        self.getRandomEvent()
    }
    
    func goToCreate(){
        navigation.onGoToCreate?()
    }
    
    
    func goToDetails(_ id: String){
        navigation.onGoToDetails?(id)
    }
    
    func getThisWeekEvents() {
        Task {@MainActor in
            let result = try await repository.getThisWeekEvents()
            thisWeekEvents = result
        }
    }
    
    func getPopularEvents() {
        Task {@MainActor in
            let result = try await repository.getPopularEvents()
            popularEvents = result
        }
    }
    
    func getCloseEvents(){
        Task {@MainActor in
            let result = try await repository.getThisWeekEvents()
            closeEvents = result
        }
    }
    
    func getRandomEvent(){
        Task {@MainActor in
            let result = try await repository.getRandomEvent()
            randomEvent = result
        }
    }
}
