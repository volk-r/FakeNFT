//
//  ProfileUpdateRequest.swift
//  FakeNFT
//
//  Created by Roman Romanov on 08.03.2025.
//

import Foundation

struct ProfileUpdateRequest: NetworkRequest {
    let id: String
    let profile: ProfileModel
    
    var endpoint: URL? {
        URL(string: "\(GlobalConstants.baseURL)/api/v1/profile/\(id)")
    }
    
    var httpMethod: HttpMethod = .put
    
    var dto: Dto? {
        ProfileUpdateDto(profile: profile)
    }
}

struct ProfileUpdateDto: Dto {
    let profile: ProfileModel
    
    func asDictionary() -> [String: String] {
        var dict: [String: String] = [:]
        
        if let name = profile.name {
            dict["name"] = name
        }
        
        if let avatar = profile.avatar {
            dict["avatar"] = avatar
        }
        
        if let description = profile.description {
            dict["description"] = description
        }
        
        if let website = profile.website {
            dict["website"] = website
        }
        
        return dict
    }
}
