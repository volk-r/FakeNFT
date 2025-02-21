//
//  User.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 19.02.2025.
//

import Foundation

struct User: Identifiable, Sendable {
    let id: String
    let name: String
    let avatar: String
    let description: String?
    let website: String
    let nfts: [String]
    let rating: String

    static func getMockData() -> [User] {
        return [
            User(
                id: "6d78ae9c-874d-440d-b7c5-db8eb571db2e",
                name: "Студентус Практикумс",
                avatar: "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/989.jpg",
                description: "Дизайнер из Казани, люблю цифровое искусство и бейглы. В моей коллекции уже 100 NFT, и еще больше — на моём сайте.",
                website: "https://practicum.yandex.ru/devops/",
                nfts: [],
                rating: "1"
            ),
            User(
                id: "f2d94f2b-83ca-42c1-ab75-f7f4571e0e06",
                name: "Ila Simpson",
                avatar: "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/519.jpg",
                description: "learn it all",
                website: "https://practicum.yandex.ru/interface-designer/",
                nfts: [
                    "5093c01d-e79e-4281-96f1-76db5880ba70",
                    "cc74e9ab-2189-465f-a1a6-8405e07e9fe4",
                    "ca34d35a-4507-47d9-9312-5ea7053994c0"
                ],
                rating: "1"
            )
        ]
    }

    static func getMockEmptyData() -> [User] {
        []
    }
}
