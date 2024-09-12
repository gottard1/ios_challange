//
//  NetworkError.swift
//  cora-ios-master
//
//  Created by Marcel Felipe Gottardi Anesi on 09/09/24.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case apiError(Error)
    case statusCode(Int)
    case noData
    case decodingError(Error)
    case reauthenticationFailed
}
