//
//  TransactionItem.swift
//  cora-ios-master
//
//  Created by Marcel Felipe Gottardi Anesi on 09/09/24.
//

import Foundation

struct TransactionItem: Codable {
    let id: String
    let description: String
    let label: String
    let entry: String
    let amount: Double
    let name: String
    let dateEvent: String
    let status: String
}
