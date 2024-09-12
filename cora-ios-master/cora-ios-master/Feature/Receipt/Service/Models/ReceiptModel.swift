//
//  ReceiptModel.swift
//  cora-ios-master
//
//  Created by Marcel Felipe Gottardi Anesi on 09/09/24.
//

import Foundation

struct ReceiptModel: Codable {
    var description: String?
    var label: String?
    var amount: Double?
    var counterPartyName: String?
    var id: String?
    var dateEvent: String?
    var recipient: BankAccount?
    var sender: BankAccount?
    var status: String?
}
