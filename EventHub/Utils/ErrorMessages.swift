//
//  ErrorMessages.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 23.11.2022.
//

import Foundation
import Firebase

enum ErrorMessages{
    case name
    case email
    case password
    case confirmPassword
    case loginPass
    
    var message: String {
        switch self{
        case .name:
            return "Numele introdus nu este confrom"
        case .email:
            return "Introduceti un email valid"
        case .password:
            return "Parola trebuie sa continta minim 8 caractere"
        case .confirmPassword:
            return "Parolele nu se potrivesc"
        case .loginPass:
            return "Parola introdusa este gresita"
            
    }
    }
    
}


