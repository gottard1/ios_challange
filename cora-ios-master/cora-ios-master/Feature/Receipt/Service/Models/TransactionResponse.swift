//
//  TransactionResponse.swift
//  cora-ios-master
//
//  Created by Marcel Felipe Gottardi Anesi on 09/09/24.
//

import Foundation

struct TransactionResponse: Codable {
    var results: [ResultModel]?
    var itemsTotal: Int?
}
