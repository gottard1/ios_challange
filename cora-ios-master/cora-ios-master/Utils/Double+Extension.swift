//
//  Double+Extension.swift
//  cora-ios-master
//
//  Created by Marcel Felipe Gottardi Anesi on 10/09/24.
//

import Foundation

extension Double {
    func toCurrencyBRL() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "R$"
        formatter.locale = Locale(identifier: "pt_BR")
        
        if let formattedValue = formatter.string(from: NSNumber(value: self)) {
            return formattedValue
        } else {
            return "R$0,00"
        }
    }
}
