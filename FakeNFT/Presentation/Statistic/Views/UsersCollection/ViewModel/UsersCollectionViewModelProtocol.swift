//
//  UsersCollectionViewModelProtocol.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 05.03.2025.
//

import SwiftUI

@MainActor
protocol UsersCollectionViewModelProtocol: AnyObject, Sendable, Observable {
    var loadingState: LoadingState { get set }
    var nftModels: [NFTModel] { get set }
    var showingErrorAlert: Bool { get set }
    func loadData() async
}
