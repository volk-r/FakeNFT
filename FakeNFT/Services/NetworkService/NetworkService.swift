//
//  NetworkService.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 24.02.2025.
//

import Foundation

actor NetworkService: NetworkServiceProtocol {
    // MARK: - Constants

    private let urlSession: URLSession
    private let decoder: JSONDecoder

    // MARK: - Initializers

    init(
        urlSession: URLSession = .shared,
        decoder: JSONDecoder = JSONDecoder()
    ) {
        self.urlSession = urlSession
        self.decoder = decoder
    }

    // MARK: - Public Methods

    func send<T: Sendable & Decodable>(request: NetworkRequest) async throws -> T? where T: Sendable & Decodable {
        guard let urlRequest = create(request: request) else { return nil }

        do {
            let (data, response) = try await urlSession.data(for: urlRequest)

            guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
                throw NetworkServiceError.invalidResponse
            }

            guard 200 ..< 300 ~= statusCode else {
                throw NetworkServiceError.httpStatusCode(statusCode)
            }

            return try decoder.decode(T.self, from: data)
        } catch {
            if let urlError = error as? URLError {
                throw NetworkServiceError.urlSessionError(urlError)
            } else if let decodingError = error as? DecodingError {
                throw NetworkServiceError.decodingError(decodingError)
            } else if let networkServiceError = error as? NetworkServiceError {
                throw networkServiceError
            } else {
                throw NetworkServiceError.unknown(error)
            }
        }
    }

    // MARK: - Private Properties

    private func create(request: NetworkRequest) -> URLRequest? {
        guard let endpoint = request.endpoint else {
            assertionFailure("Empty endpoint")
            return nil
        }
        var urlRequest = URLRequest(url: endpoint)
        urlRequest.httpMethod = request.httpMethod.rawValue
        urlRequest.addValue(GlobalConstants.token, forHTTPHeaderField: "X-Practicum-Mobile-Token")

        if let dtoDictionary = request.dto?.asDictionary() {
            var urlComponents = URLComponents()
            let queryItems = dtoDictionary.map { field in
                URLQueryItem(
                    name: field.key,
                    value: field.value
                    )
            }
            urlComponents.queryItems = queryItems
            urlRequest.httpBody = urlComponents.query?.data(using: .utf8)
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        urlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        return urlRequest
    }
}
