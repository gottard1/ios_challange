//
//  String+Extension.swift
//  cora-ios-master
//
//  Created by Marcel Felipe Gottardi Anesi on 10/09/24.
//

import Foundation

enum DateFormatType {
    /// Ex.: Segunda-feira - 8 de Agosto, Hoje - 6 de Agosto, Ontem - 5 de Agosto
    case weekdayDayMonthFull
    /// Ex.: 17:35
    case timeOnly
    /// Ex.: Hoje - 06/07/2024, Ontem - 05/07/2024, Segunda-feira - 04/07/2024
    case weekdayDayMonthYear
}

extension String {
    
    func formattedDate(for formatType: DateFormatType) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        var date: Date? = dateFormatter.date(from: self)
        
        if date == nil {
            dateFormatter.dateFormat = "yyyy-MM-dd"
            date = dateFormatter.date(from: self)
        }
        
        guard let finalDate = date else {
            return nil
        }
        
        let calendar = Calendar.current
        let today = Date()
        let components = calendar.dateComponents([.day], from: calendar.startOfDay(for: today), to: calendar.startOfDay(for: finalDate))
        let daysDifference = components.day ?? 0
        
        dateFormatter.locale = Locale(identifier: "pt_BR")
        switch formatType {
            case .weekdayDayMonthFull:
                if daysDifference == 0 {
                    dateFormatter.dateFormat = "'Hoje - 'd 'de' MMMM"
                } else if daysDifference == -1 {
                    dateFormatter.dateFormat = "'Ontem - 'd 'de' MMMM"
                } else {
                    dateFormatter.dateFormat = "EEEE - d 'de' MMMM"
                }
            case .weekdayDayMonthYear:
                if daysDifference == 0 {
                    dateFormatter.dateFormat = "'Hoje - 'dd/MM/yyyy"
                } else if daysDifference == -1 {
                    dateFormatter.dateFormat = "'Ontem - 'dd/MM/yyyy"
                } else {
                    dateFormatter.dateFormat = "EEEE - dd/MM/yyyy"
                }
            case .timeOnly:
                dateFormatter.dateFormat = "HH:mm"
        }
        
        return dateFormatter.string(from: finalDate)
    }

    
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
}
