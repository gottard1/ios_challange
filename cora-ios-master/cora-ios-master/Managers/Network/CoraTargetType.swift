//
//  CoraTargetType.swift
//  cora-ios-master
//
//  Created by Marcel Felipe Gottardi Anesi on 09/09/24.
//

import Foundation

protocol CoraTargetType {
    var baseURL: String { get }
    var path: String { get }
    var method: NetworkMethods { get }
    var headers: [String: String]? { get }
    var body: Data? { get }
}
