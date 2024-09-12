//
//  ResultModel.swift
//  cora-ios-master
//
//  Created by Marcel Felipe Gottardi Anesi on 09/09/24.
//

import Foundation

struct ResultModel: Codable {
    let items: [TransactionItem]
    let date: String
}
