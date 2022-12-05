//
//  RegisterViewModel.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 22.11.2022.
//

import SwiftUI
import Combine

protocol RegisterViewModelProtocol: ObservableObject {
    var email: String { get set }
    var name: String { get set }
    var password: String { get set }
    var confirmPassword: String { get set }
    var prompt: String { get set }
    
    var hasEmailError: Bool { get set }
    var hasNameError: Bool { get set }
    var hasPasswordError: Bool { get set }
    var hasPasswordConfirmationError: Bool { get set }
    var canSubmit: Bool { get set }
    
    func register()
    func goToSignIn()
}

final class RegisterViewModel: RegisterViewModelProtocol {
    @Published var email: String = ""
    @Published var name: String = ""
    @Published var confirmPassword: String = ""
    @Published var password: String = ""
    @Published var prompt: String = ""
    
    @Published var hasEmailError = false
    @Published var hasNameError = false
    @Published var hasPasswordError = false
    @Published var hasPasswordConfirmationError = false
    @Published var canSubmit = false
    private var cancellableSet: Set<AnyCancellable> = []
    
    let emailPredicate = NSPredicate(format: "SELF MATCHES %@","(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])")
    let passwordPredicate = NSPredicate(format: "SELF MATCHES %@","^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$")
    
    let namePredicate = NSPredicate(format: "SELF MATCHES %@", "(^[A-Za-z]{3,16})([ ]{0,1})([A-Za-z]{3,16})?([ ]{0,1})?([A-Za-z]{3,16})?([ ]{0,1})?([A-Za-z]{3,16})" )
    
    private let repository: RegisterRepositoryProtocol
    private let navigation: RegisterNavigationProtocol
    
    init(repository: RegisterRepositoryProtocol, navigation: RegisterNavigationProtocol) {
        self.repository = repository
        self.navigation = navigation
        
        $name
            .map{ name in
                if name.count > 2 {
                    let value = self.namePredicate.evaluate(with: name)
                    return !value
                    
                }else{
                    return false
                }
            }
            .assign(to: \.hasNameError, on: self)
            .store(in: &cancellableSet)
        
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
        
        Publishers.CombineLatest($password, $confirmPassword)
            .map{ password, confirmPassword in
                if password == confirmPassword || confirmPassword.count < 3{
                    return false
                }else{
                    return true
                }
            }
            .assign(to: \.hasPasswordConfirmationError, on: self)
            .store(in: &cancellableSet)
        
        Publishers.CombineLatest4($hasNameError, $hasPasswordError, $hasEmailError, $hasPasswordConfirmationError)
            .map{hasEmailError, hasPasswordError, hasPasswordConfirmationError, hasNameError in
                if self.name.count > 2 && self.email.count > 2 {
                    return(!hasEmailError && !hasNameError && !hasPasswordError && !hasPasswordConfirmationError)
                    
                }else{
                    return false
                }
            }
            .assign(to: \.canSubmit, on:self)
            .store(in: &cancellableSet)
    }
    
    func register(){
        
        print("Signing up \(email).")
        email = ""
        password = ""
        confirmPassword = ""
        name = ""
    }
    
    func goToSignIn() {
        navigation.onGoToSignIn?()
    }
}

