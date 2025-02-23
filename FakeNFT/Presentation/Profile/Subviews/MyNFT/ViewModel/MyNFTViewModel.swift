//
//  MyNFTViewModel.swift
//  FakeNFT
//
//  Created by Roman Romanov on 23.02.2025.
//

import Foundation

@Observable
final class MyNFTViewModel {
    
    // MARK: - Properties
    
    var nftsData: [NFTModel] = []
    
    var showingSortingDialog: Bool = false
    var sortType: NFTSortingType = .byPrice {
        didSet {
            switch sortType {
            case .byPrice:
                print("Сортировка по прайсу")
            case .byRating:
                print("Сортировка по рейтингу")
            case .byName:
                print("Сортировка по имени")
            }
        }
    }
    
    // MARK: - fetchNFTData
    
    func fetchNFTData(nftIDs: [String]?) {
        guard nftIDs != nil else { return }
        
        fetchMockNFTData()
    }
    
    // MARK: - fetchMockNFTData
    
    func fetchMockNFTData() {
        nftsData = [
            NFTModel(
                createdAt: "2023-10-08T07:43:22.944Z[GMT]",
                name: "Finn",
                images: [
                    "https://code.s3.yandex.net/Mobile/iOS/NFT/Beige/Finn/1.png",
                    "https://code.s3.yandex.net/Mobile/iOS/NFT/Beige/Finn/2.png",
                    "https://code.s3.yandex.net/Mobile/iOS/NFT/Beige/Finn/3.png"
                ],
                rating: 3,
                description: "explicari lobortis rutrum evertitur fugit convenire ligula",
                price: 28.27,
                author: "John Doe",
                id: "7773e33c-ec15-4230-a102-92426a3a6d5a"
            ),
            NFTModel(
                createdAt: "2023-06-08T05:52:06.646Z[GMT]",
                name: "Daryl Lucas",
                images: [
                    "https://code.s3.yandex.net/Mobile/iOS/NFT/Peach/Nacho/1.png",
                    "https://code.s3.yandex.net/Mobile/iOS/NFT/Peach/Nacho/2.png",
                    "https://code.s3.yandex.net/Mobile/iOS/NFT/Peach/Nacho/3.png"
                ],
                rating: 2,
                description: "animal solet pharetra perpetua usu alienum",
                price: 43.53,
                author: "https://strange_gates.fakenfts.org/",
                id: "a4edeccd-ad7c-4c7f-b09e-6edec02a812b"
            ),
            NFTModel(
                createdAt: "2023-06-13T09:59:28.425Z[GMT]",
                name: "Lonnie Mercado",
                images: [
                    "https://code.s3.yandex.net/Mobile/iOS/NFT/Beige/Penny/1.png",
                    "https://code.s3.yandex.net/Mobile/iOS/NFT/Beige/Penny/2.png",
                    "https://code.s3.yandex.net/Mobile/iOS/NFT/Beige/Penny/3.png"
                ],
                rating: 2,
                description: "agam dicant referrentur facilisi interpretaris",
                price: 23.02,
                author: "https://objective_kilby.fakenfts.org/",
                id: "eb959204-76cc-46ef-ba07-aefa036ca1a5"
            ),
            NFTModel(
                createdAt: "2023-07-11T00:08:48.728Z[GMT]",
                name: "Minnie Sanders",
                images: [
                    "https://code.s3.yandex.net/Mobile/iOS/NFT/Pink/Lilo/1.png",
                    "https://code.s3.yandex.net/Mobile/iOS/NFT/Pink/Lilo/2.png",
                    "https://code.s3.yandex.net/Mobile/iOS/NFT/Pink/Lilo/3.png"
                ],
                rating: 2,
                description: "mediocritatem interdum eleifend penatibus adipiscing mattis",
                price: 40.59,
                author: "https://wonderful_dubinsky.fakenfts.org/",
                id: "594aaf01-5962-4ab7-a6b5-470ea37beb93"
            ),
            NFTModel(
                createdAt: "2023-07-11T05:27:40.359Z[GMT]",
                name: "James Burt",
                images: [
                    "https://code.s3.yandex.net/Mobile/iOS/NFT/Blue/Clover/1.png",
                    "https://code.s3.yandex.net/Mobile/iOS/NFT/Blue/Clover/2.png",
                    "https://code.s3.yandex.net/Mobile/iOS/NFT/Blue/Clover/3.png"
                ],
                rating: 2,
                description: "eos habeo percipit duis malesuada",
                price: 11.14,
                author: "https://exciting_pare.fakenfts.org/",
                id: "cc74e9ab-2189-465f-a1a6-8405e07e9fe4"
            ),
            NFTModel(
                createdAt: "2023-09-27T23:48:21.462Z[GMT]",
                name: "Myrna Cervantes",
                images: [
                    "https://code.s3.yandex.net/Mobile/iOS/NFT/Beige/Ellsa/1.png",
                    "https://code.s3.yandex.net/Mobile/iOS/NFT/Beige/Ellsa/2.png",
                    "https://code.s3.yandex.net/Mobile/iOS/NFT/Beige/Ellsa/3.png"
                ],
                rating: 5,
                description: "eloquentiam deterruisset tractatos repudiandae nunc a electram",
                price: 39.37,
                author: "https://priceless_leavitt.fakenfts.org/",
                id: "c14cf3bc-7470-4eec-8a42-5eaa65f4053c"
            )
        ]
    }
}
