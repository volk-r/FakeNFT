//
//  NetworkTask.swift
//  FakeNFT
//
//  Created by Сергей Кухарев on 18.02.2025.
//
import Foundation

protocol NetworkTask {
    func cancel()
}

struct DefaultNetworkTask: NetworkTask {
    let dataTask: URLSessionDataTask

    func cancel() {
        dataTask.cancel()
    }
}
