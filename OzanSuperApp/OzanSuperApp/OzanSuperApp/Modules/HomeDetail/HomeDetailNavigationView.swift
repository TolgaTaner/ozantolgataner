//
//  HomeDetailNavigationView.swift
//  OzanSuperApp
//
//  Created by Tolga Taner on 21.03.2025.
//

import UIKit

protocol HomeDetailNavigationViewDelegate: AnyObject {
    func backButtonDidTapped()
}

final class HomeDetailNavigationView: CustomXibView {
    
    @IBOutlet private weak var currencyLongNameLabel: UILabel!
    @IBOutlet private weak var currencyShortNameLabel: UILabel!
    @IBOutlet private weak var backButton: UIButton!
    @IBOutlet private weak var alertImageView: UIImageView!
    
    weak var delegate: HomeDetailNavigationViewDelegate?
    
    func configure(coin: Coin, delegate: HomeDetailNavigationViewDelegate) {
        currencyShortNameLabel.text = coin.symbol
        currencyLongNameLabel.text = coin.name
        self.delegate = delegate
    }
    
    @IBAction private func backButtonDidTapped(_ sender: Any) {
        delegate?.backButtonDidTapped()
    }
}
