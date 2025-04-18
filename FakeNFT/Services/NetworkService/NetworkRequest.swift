//
//  NetworkRequest.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 18.02.2025.
//
import Foundation

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

protocol NetworkRequest: Sendable {
    var endpoint: URL? { get }
    var httpMethod: HttpMethod { get }
    var dto: Dto? { get }
}

protocol Dto: Sendable {
    func asDictionary() -> [String: String]
}

// default values
extension NetworkRequest {
    var httpMethod: HttpMethod { .get }
    var dto: Encodable? { nil }
}
