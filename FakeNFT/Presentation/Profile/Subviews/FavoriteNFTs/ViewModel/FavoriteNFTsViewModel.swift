//
//  FavoriteNFTsViewModel.swift
//  FakeNFT
//
//  Created by Roman Romanov on 26.02.2025.
//

import Foundation

@Observable
final class FavoriteNFTsViewModel: FavoriteNFTsViewModelProtocol {
    
    // MARK: - Properties
    
    private let nftDetailsService: NFTDetailsServiceProtocol
    
    private(set) var favoriteNFTsData: [NFTModel] = []
    private(set) var loadingState: LoadingState = .default
    private(set) var isEmptyNFTs: Bool = true
    
    // MARK: - init
    
    init(nftDetailsService: NFTDetailsServiceProtocol = NFTDetailsService()) {
        self.nftDetailsService = nftDetailsService
    }
    
    // MARK: - fetchNFTData
    
    func fetchNFTData(likeIDs: [String]?) async {
        guard
            let likeIDs,
            !likeIDs.isEmpty
        else {
            isEmptyNFTs = true
            return
        }
        
        isEmptyNFTs = false
        loadingState = .loading
        
        do {
            if ProcessInfo.processInfo.environment["USE_MOCK_DATA"] == "true" {
                await fetchMockNFTData()
            } else {
                favoriteNFTsData = try await nftDetailsService.loadNFT(for: likeIDs)
            }
            loadingState = .success
        } catch {
            loadingState = .failure
        }
    }
    
    // MARK: - fetchMockNFTData
    
    // swiftlint:disable function_body_length
    func fetchMockNFTData() async {
        loadingState = .loading
        
        do {
            try await Task.sleep(for: .seconds(5))
           
            loadingState = .success
            favoriteNFTsData = [
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
                    name: "Daryl",
                    images: [
                        "https://code.s3.yandex.net/Mobile/iOS/NFT/Peach/Nacho/1.png",
                        "https://code.s3.yandex.net/Mobile/iOS/NFT/Peach/Nacho/2.png",
                        "https://code.s3.yandex.net/Mobile/iOS/NFT/Peach/Nacho/3.png"
                    ],
                    rating: 2,
                    description: "animal solet pharetra perpetua usu alienum",
                    price: 43.53,
                    author: "Daryl Lucas",
                    id: "a4edeccd-ad7c-4c7f-b09e-6edec02a812b"
                ),
                NFTModel(
                    createdAt: "2023-06-13T09:59:28.425Z[GMT]",
                    name: "Lonnie",
                    images: [
                        "https://code.s3.yandex.net/Mobile/iOS/NFT/Beige/Penny/1.png",
                        "https://code.s3.yandex.net/Mobile/iOS/NFT/Beige/Penny/2.png",
                        "https://code.s3.yandex.net/Mobile/iOS/NFT/Beige/Penny/3.png"
                    ],
                    rating: 2,
                    description: "agam dicant referrentur facilisi interpretaris",
                    price: 23.02,
                    author: "Lonnie Mercado",
                    id: "eb959204-76cc-46ef-ba07-aefa036ca1a5"
                ),
                NFTModel(
                    createdAt: "2023-07-11T00:08:48.728Z[GMT]",
                    name: "Minnie",
                    images: [
                        "https://code.s3.yandex.net/Mobile/iOS/NFT/Pink/Lilo/1.png",
                        "https://code.s3.yandex.net/Mobile/iOS/NFT/Pink/Lilo/2.png",
                        "https://code.s3.yandex.net/Mobile/iOS/NFT/Pink/Lilo/3.png"
                    ],
                    rating: 2,
                    description: "mediocritatem interdum eleifend penatibus adipiscing mattis",
                    price: 40.59,
                    author: "Minnie Sanders",
                    id: "594aaf01-5962-4ab7-a6b5-470ea37beb93"
                ),
                NFTModel(
                    createdAt: "2023-07-11T05:27:40.359Z[GMT]",
                    name: "James",
                    images: [
                        "https://code.s3.yandex.net/Mobile/iOS/NFT/Blue/Clover/1.png",
                        "https://code.s3.yandex.net/Mobile/iOS/NFT/Blue/Clover/2.png",
                        "https://code.s3.yandex.net/Mobile/iOS/NFT/Blue/Clover/3.png"
                    ],
                    rating: 2,
                    description: "eos habeo percipit duis malesuada",
                    price: 11.14,
                    author: "James",
                    id: "cc74e9ab-2189-465f-a1a6-8405e07e9fe4"
                ),
                NFTModel(
                    createdAt: "2023-09-27T23:48:21.462Z[GMT]",
                    name: "Myrna",
                    images: [
                        "https://code.s3.yandex.net/Mobile/iOS/NFT/Beige/Ellsa/1.png",
                        "https://code.s3.yandex.net/Mobile/iOS/NFT/Beige/Ellsa/2.png",
                        "https://code.s3.yandex.net/Mobile/iOS/NFT/Beige/Ellsa/3.png"
                    ],
                    rating: 5,
                    description: "eloquentiam deterruisset tractatos repudiandae nunc a electram",
                    price: 39.37,
                    author: "Myrna",
                    id: "c14cf3bc-7470-4eec-8a42-5eaa65f4053c"
                )
            ]
        } catch {
            loadingState = .failure
        }
    }
    // swiftlint:enable function_body_length
}
