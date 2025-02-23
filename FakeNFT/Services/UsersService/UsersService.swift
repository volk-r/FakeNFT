//
//  UsersService.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 23.02.2025.
//
import Foundation

actor UsersService: UsersServiceProtocol {
    // MARK: - Constants

    private let urlSession: URLSession
    private let syncQueue = DispatchQueue(label: "UsersService", attributes: .concurrent)

    // MARK: - Initializers

    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }

    // MARK: - Public Methods

    func loadUsers(fromPage page: Int, count: Int, sortBy: UsersSortType) async throws -> [User] {
        guard var components = URLComponents(string: "\(GlobalConstants.baseURL)/api/v1/users") else {
            throw NetworkServiceError.urlRequestError
        }
        let params: [String: String] = [
            "size": "\(count)",
            "sortBy": "\(sortBy.rawValue)",
            "page": "\(page)"
        ]
        components.queryItems = params.map { URLQueryItem(name: $0.key, value: $0.value) }
        guard let url = components.url else {
            throw NetworkServiceError.urlRequestError
        }
        
        var request = URLRequest(url: url)
        request.addValue(GlobalConstants.token, forHTTPHeaderField: "X-Practicum-Mobile-Token")
        
        do {
            let (data, response) = try await urlSession.data(for: request)
            
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
                throw NetworkServiceError.unknown
            }
            
            guard 200 ..< 300 ~= statusCode else {
                throw NetworkServiceError.httpStatusCode(statusCode)
            }
            
            return try JSONDecoder().decode([User].self, from: data)
        } catch {
            if let urlError = error as? URLError {
                throw NetworkServiceError.urlSessionError(urlError)
            } else if let decodingError = error as? DecodingError {
                throw NetworkServiceError.decodingError(decodingError)
            } else {
                throw NetworkServiceError.unknown
            }
        }
    }
}
