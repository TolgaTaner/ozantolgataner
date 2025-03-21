//
//  HomeDetailViewModel.swift
//  OzanSuperApp
//
//  Created by Tolga Taner on 21.03.2025.
//

import Foundation

protocol HomeDetailViewModelDelegate: BaseViewModelDelegate {
    
}

final class HomeDetailViewModel {
    
    private weak var delegate: HomeDetailViewModelDelegate?
    let coin: Coin
    
    init(coin: Coin) {
        self.coin = coin
    }
    
    func setDelegate(_ delegate: HomeDetailViewModelDelegate) {
        self.delegate = delegate
    }
}
//MARK: - HomeViewControllerDelegate
extension HomeDetailViewModel: HomeDetailViewControllerDelegate {
    func viewWillAppear() {
        delegate?.configureAfterViewWillAppear()
    }
    
    func viewDidLoad() {
        delegate?.configureAfterViewDidLoad()
    }
}
