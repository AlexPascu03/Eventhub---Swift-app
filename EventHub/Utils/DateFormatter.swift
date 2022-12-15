//
//  DateFormatter.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 29.11.2022.
//

import Foundation

extension Formatter {
    
    static let weekdayWithMonthAndDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, d MMM"
        formatter.locale = Locale(identifier: "ro")
        return formatter
    }()
    
    static let dayAndMonth: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM"
        formatter.locale = Locale(identifier: "ro")
        return formatter
    }()
    
    static let hourAndMinutes: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        formatter.locale = Locale(identifier: "ro")
        return formatter
    }()
    
    static let weekdayWithMonthDateAndYear: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMMM d yyyy"
        formatter.locale = Locale(identifier: "ro")
        return formatter
    }()
    
}
