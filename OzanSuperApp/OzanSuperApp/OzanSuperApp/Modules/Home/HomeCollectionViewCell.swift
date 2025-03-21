//
//  HomeCollectionViewCell.swift
//  OzanSuperApp
//
//  Created by Tolga Taner on 20.03.2025.
//

import UIKit

final class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var percentagePriceLabel: UILabel!
    @IBOutlet private weak var percentageLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var coinLongNameLabel: UILabel!
    @IBOutlet private weak var coinShortNameLabel: UILabel!
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var homeContentView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        homeContentView.layer.cornerRadius = 8
        homeContentView.layer.masksToBounds = true
    }
    
    func configure(_ coin: Coin) {
        coinShortNameLabel.text = coin.symbol
        coinLongNameLabel.text = coin.name
        priceLabel.text = coin.formattedPrice
        backgroundColor = .clear
        if let changeInNumberValue = coin.change.numberValue {
            if changeInNumberValue.isPositive {
                percentagePriceLabel.textColor = .systemGreen
                percentageLabel.textColor = .systemGreen
            }
            else {
                percentagePriceLabel.textColor = .systemRed
                percentageLabel.textColor = .systemRed
            }
        }
        percentagePriceLabel.text = coin.changeInPrice
        percentageLabel.text = coin.formattedChange
        guard let url = URL(string: coin.iconURL) else { return }
        iconImageView.sd_setImage(with: url)
    }

}
