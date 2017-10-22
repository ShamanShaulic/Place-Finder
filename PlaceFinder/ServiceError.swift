//
//  ServiceError.swift
//  PlaceFinder
//
//  Created by Nikola Sabelnik on 10/3/17.
//  Copyright © 2017 SabelnikN. All rights reserved.
//

import Foundation



enum ServiceError: Error {
    case noInternetConnection
    case custom(String)
    case other
}


extension ServiceError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .noInternetConnection:
            return "No Internet connection"
        case .other:
            return "Something went wrong"
        case .custom(let message):
            return message
        }
    }
}


