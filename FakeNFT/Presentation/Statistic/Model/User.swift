//
//  User.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 19.02.2025.
//

import Foundation

struct User: Codable, Identifiable, Sendable, Equatable {
    let id: String
    let name: String
    let avatar: String
    let description: String?
    let website: String
    let nfts: [String]
    let rating: String

    static func getMockData() throws -> [User] { // swiftlint:disable:this function_body_length
        [
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
            ),
            User(
                id: "4972d5e9-e575-42c7-9b81-240ffdabc3d6",
                name: "Antony Langley",
                avatar: "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/991.jpg",
                description: nil,
                website: "https://student19.students.practicum.org",
                nfts: [],
                rating: "2"
            ),
            User(
                id: "77bd726b-15bc-4ad3-92c4-c4c97adb9491",
                name: "Maxim Sokolov",
                avatar: "https://n1s2.hsmedia.ru/10/07/5b/10075bc9f87787e109c8bd9d93e8d66b/600x400_0x0a330c9a_8308133731545062329.jpeg",
                description: "Description long ...\r\nVery long description …",
                website: "https://ya.ru",
                nfts: [],
                rating: "1"
            ),
            User(
                id: "5cf78231-6344-407f-a3f8-f354c647b10b",
                name: "Emil Sosa",
                avatar: "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/37.jpg",
                description: "daddsd",
                website: "https://student18.students.practicum.org",
                nfts: [
                    "83c23ccc-1368-4da8-b54d-76c9b235835b",
                    "a4edeccd-ad7c-4c7f-b09e-6edec02a812b",
                    "cc74e9ab-2189-465f-a1a6-8405e07e9fe4",
                    "7773e33c-ec15-4230-a102-92426a3a6d5a",
                    "3434c774-0e0f-476e-a314-24f4f0dfed86",
                    "eb959204-76cc-46ef-ba07-aefa036ca1a5",
                    "594aaf01-5962-4ab7-a6b5-470ea37beb93",
                    "ca34d35a-4507-47d9-9312-5ea7053994c0"
                ],
                rating: "1"
            ),
            User(
                id: "b199bd7e-2660-4fbd-8bc5-9346335dcb97",
                name: "Jimmie Reilly",
                avatar: "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/594.jpg",
                description: "daddsd",
                website: "ttps://student7.students.practicum.org",
                nfts: [],
                rating: "1"
            )
        ]
    }

    static func getMockEmptyData() -> [User] {
        []
    }
    
    static func getMockUserData() -> User {
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
    }
}
