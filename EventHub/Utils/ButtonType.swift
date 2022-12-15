//
//  ButtonType.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 08.12.2022.
//

import Foundation
import SwiftUI

enum ButtonType {
    case blue
    case red
    case white
    
    var bgColor: Color {
        switch self {
        case .blue:
            return Color.ehPurple
        case .red:
            return Color.dashRed
        case .white:
            return Color.white
        }
    }
    
    var borderColor: Color {
        switch self {
        case .blue:
            return Color.ehPurple
        case .red:
            return Color.dashRed
        case .white:
            return Color.ehPurple
        }
    }
    
    var labelColor: Color {
        switch self {
        case .blue:
            return Color.white
        case .red:
            return Color.white
        case .white:
            return Color.ehPurple
        }
    }
    
}
