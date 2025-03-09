//
//  ProfileUpdateLikesRequest.swift
//  FakeNFT
//
//  Created by Artem Polivanov on 07.03.2025.
//

import Foundation

struct ProfileUpdateLikesRequest: NetworkRequest {
    let id: String
    let likes: [String]
    
    var endpoint: URL? {
        URL(string: "\(GlobalConstants.baseURL)/api/v1/profile/\(id)")
    }
    
    var httpMethod: HttpMethod = .put
    
    var dto: Dto? {
        ProfileUpdateLikesDto(likes: likes)
    }
}

struct ProfileUpdateLikesDto: Dto {
    let likes: [String]
    
    func asDictionary() -> [String: String] {
         let joinedLikes = likes.joined(separator: ",")
        return ["likes": joinedLikes]
    }
}
