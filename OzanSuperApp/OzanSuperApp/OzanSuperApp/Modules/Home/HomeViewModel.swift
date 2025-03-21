//
//  HomeViewModel.swift
//  OzanSuperApp
//
//  Created by Tolga Taner on 18.03.2025.
//

import Foundation

protocol HomeViewModelDelegate: BaseViewModelDelegate {
    func fetchedCoinsSuccessfully()
    func fetchedCoinsFailed(_  error: Error)
    func filterDidFinished(_ type: HomeViewModel.SortType)
}

final class HomeViewModel {
    private weak var delegate: HomeViewModelDelegate?
    private let client: HomeClient
    var coins: [Coin]
    
    enum SortType: String, CaseIterable {
        case volume = "24h Vol"
        case price = "Price"
        case marketCap = "Market Cap"
        case change = "Change"
        case listedAt = "ListedAt"
    }
    
    private struct Constant {
        static let coinsPath = "/api/v1/dummy/coins"
    }
    
    init() {
        coins = []
        client = HomeClient()
    }
    
    func setDelegate(_ delegate: HomeViewModelDelegate) {
        self.delegate = delegate
    }
}
//MARK: - HomeViewControllerDelegate
extension HomeViewModel: HomeViewControllerDelegate {
    func sortCoins(byType type: HomeViewModel.SortType) {
        switch type {
        case .change: coins.sort { $0.change.numberValue?.doubleValue ?? 0.0 > $1.change.numberValue?.doubleValue ?? 0.0 }
        case .listedAt: coins.sort { $0.listedAt > $1.listedAt }
        case .marketCap: coins.sort { $0.marketCap.numberValue?.doubleValue ?? 0.0 > $1.marketCap.numberValue?.doubleValue ?? 0.0 }
        case .price: coins.sort { $0.price.numberValue?.doubleValue ?? 0.0 > $1.price.numberValue?.doubleValue ?? 0.0 }
        case .volume: coins.sort { $0.the24HVolume.numberValue?.doubleValue ?? 0.0 > $1.the24HVolume.numberValue?.doubleValue ?? 0.0 }
        }
        delegate?.filterDidFinished(type)
    }
    
    func getCoin(atRow row: Int) -> Coin {
        coins[row]
    }
    
    func getCoins() {
        client.get(path: Constant.coinsPath)
    }
    
    func viewWillAppear() {
        delegate?.configureAfterViewWillAppear()
    }
    
    func viewDidLoad() {
        client.delegate = self
        delegate?.configureAfterViewDidLoad()
    }
}
//MARK: - HomeClientDelegate
extension HomeViewModel: HomeClientDelegate {
    func homeClient(didSucceedFetching response: HomeResponse) {
        coins = response.coins
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.delegate?.fetchedCoinsSuccessfully()
        }
    }
    
    func homeClient(didFailureFething error: any Error) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.delegate?.fetchedCoinsFailed(error)
        }
    }
}
