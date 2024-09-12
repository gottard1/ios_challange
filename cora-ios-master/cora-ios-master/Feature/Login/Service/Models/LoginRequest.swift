//
//  LoginRequest.swift
//  cora-ios-master
//
//  Created by Marcel Felipe Gottardi Anesi on 09/09/24.
//

import Foundation

struct LoginRequest: Codable {
    var cpf: String?
    var password: String?
    var token: String?
}
