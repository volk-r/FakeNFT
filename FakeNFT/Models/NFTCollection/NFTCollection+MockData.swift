//
//  NFTCollection+MockData.swift
//  FakeNFT
//
//  Created by Artem Polivanov on 23.02.2025.
//

import Foundation

extension NFTCollection {
    static let mock1 = NFTCollection(
        createdAt: "2023-11-21T15:21:36.683Z[GMT]",
        name: "singulis epicuri",
        cover: "https://code.s3.yandex.net/Mobile/iOS/NFT/Обложки_коллекций/Brown.png",
        nfts: [
            "c14cf3bc-7470-4eec-8a42-5eaa65f4053c",
            "d6a02bd1-1255-46cd-815b-656174c1d9c0",
            "f380f245-0264-4b42-8e7e-c4486e237504"
        ],
        description: "curabitur feugait a definitiones singulis movet eros aeque mucius evertitur assueverit et eam",
        author: "Lourdes Harper",
        id: "d4fea6b6-91f1-45ce-9745-55431e69ef5c"
    )
    
    static let mock2 = NFTCollection(
        createdAt: "2023-11-21T15:21:36.691Z[GMT]",
        name: "unum reque",
        cover: "https://code.s3.yandex.net/Mobile/iOS/NFT/Обложки_коллекций/White.png",
        nfts: [
            "82570704-14ac-4679-9436-050f4a32a8a0",
            "e33e18d5-4fc2-466d-b651-028f78d771b8"
        ],
        description: "dictas singulis placerat interdum maximus referrentur partiendo explicari verear molestiae",
        author: "Darren Morris",
        id: "81268b05-db02-4bc9-b0b0-f7136de49706"
    )
}
