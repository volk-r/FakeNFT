//
//  NetworkServiceError.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 23.02.2025.
//

import Foundation

enum NetworkServiceError: Error {
    case urlRequestError
    case invalidResponse
    case httpStatusCode(Int)
    case urlSessionError(Error)
    case decodingError(Error)
    case unknown(Error)
}
