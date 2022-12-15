//
//  SignInViewModel.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 22.11.2022.
//

import SwiftUI
import Firebase
import Combine

protocol SignInViewModelProtocol: ObservableObject {
    var email: String { get set }
    var password: String { get set }
    var prompt: String { get set }
    var alertText: String { get set }
    
    var hasEmailError: Bool { get set }
    var hasPasswordError: Bool { get set }
    var canSubmit: Bool { get set }
    var hasAlert: Bool { get set }
    
    func login()
    func goToRegister()
}

final class SignInViewModel: SignInViewModelProtocol {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var prompt: String = ""
    @Published var alertText: String = ""
    
    @Published var hasEmailError = false
    @Published var hasPasswordError = false
    @Published var canSubmit = false
    @Published var hasAlert = false
    private var cancellableSet: Set<AnyCancellable> = []
    
    private let emailPredicate = NSPredicate(format: "SELF MATCHES %@","(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])")
    private let passwordPredicate = NSPredicate(format: "SELF MATCHES %@","^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$")
    
    private let repository: SignInRepositoryProtocol
    private let navigation: SignInNavigationProtocol
    
    init(repository: SignInRepositoryProtocol, navigation: SignInNavigationProtocol) {
        self.repository = repository
        self.navigation = navigation
        
        $email
            .map{ email in
                if email.count > 2 {
                    let value = self.emailPredicate.evaluate(with: email)
                    return !value
                }else{
                    return false
                }
            }
            .assign(to: \.hasEmailError, on: self)
            .store(in: &cancellableSet)
        
        $password
            .map{ password in
                if password.count > 2 && password.count < 7 {
                    let value = self.passwordPredicate.evaluate(with: password)
                    return !value
                }else{
                    return false
                }
            }
            .assign(to: \.hasPasswordError, on: self)
            .store(in: &cancellableSet)
    }
    func login(){
        repository.loginUser(email: email, password: password) { result in
            switch result {
            case .success:
                self.goToMainPage()
            case .failure(let errorMessage):
                self.hasAlert = true
                self.alertText = errorMessage.localizedDescription
            }
        }
    }
    func goToRegister() {
        navigation.onGoToRegister?()
    }
    
    func goToMainPage() {
        navigation.onGoToMainPage?()
        print("should go to main page")
    }
}
