//
//  NetworkServiceProtocol.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 24.02.2025.
//

import Foundation

protocol NetworkServiceProtocol: Sendable {
    func send<T: Sendable & Decodable>(request: NetworkRequest) async throws -> T?
}
