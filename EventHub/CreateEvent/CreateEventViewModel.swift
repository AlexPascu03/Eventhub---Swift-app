//
//  CreateEventViewModel.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 30.11.2022.
//

import Foundation
import SwiftUI
import PhotosUI
import Firebase
import Combine

protocol CreateEventViewModelProtocol: ObservableObject {
    var name: String { get set }
    var location: String { get set }
    var description: String { get set }
    var date: Date { get set }
    var image: UIImage? { get set }
    
    var hasNameError: Bool { get set }
    var hasLocationError: Bool { get set }
    var hasDescriptionError: Bool { get set }
    var isPickerShowing: Bool { get set }
    var canSubmit: Bool { get set }
    
    func goToMainPage()
    func addEventToDb()
}

final class CreateEventViewModel: CreateEventViewModelProtocol {
    @Published var name: String = ""
    @Published var location: String = "Oradea, Romania"
    @Published var description: String = ""
    @Published var date: Date = Date()
    @Published var image: UIImage?
    
    var userId = Auth.auth().currentUser?.uid
    
    @State var isPickerShowing = false
    @State private var selectedItem: PhotosPickerItem? = nil
    
    @Published var canSubmit = false
    @Published var hasNameError = false
    @Published var hasLocationError = false
    @Published var hasDescriptionError = false
    private var cancellableSet: Set<AnyCancellable> = []
    
    let repository: CreateEventRepositoryProtocol
    let navigation: CreateEventNavigationProtocol
    
    init(repository: CreateEventRepositoryProtocol, navigation: CreateEventNavigationProtocol) {
        self.repository = repository
        self.navigation = navigation
        
        Publishers.CombineLatest($description, $name)
            .map{description, name in
                if name.count < 2 || description.count < 2{
                    return false}
                else{
                    return true
                }
            }
            .assign(to: \.canSubmit, on: self )
            .store(in: &cancellableSet)
    }
    
    func addEventToDb(){
        repository.addEventToDb(userID: userId!, name: name, location: location, description: description, date: date, image: image) { result in
            switch result {
            case .success:
                print("succesful")
            case .failure:
                print("failed")
            }
        }
    }
    
    func goToMainPage() {
        print("back")
        navigation.onGoToMainPage?()
    }
}
