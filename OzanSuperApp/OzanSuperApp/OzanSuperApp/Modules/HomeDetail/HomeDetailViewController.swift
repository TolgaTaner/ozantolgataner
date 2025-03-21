//
//  HomeDetailViewController.swift
//  OzanSuperApp
//
//  Created by Tolga Taner on 21.03.2025.
//

import UIKit


protocol HomeDetailViewControllerDelegate: BaseViewControllerDelegate {
}

final class HomeDetailViewController: UIViewController {
    
    @IBOutlet private weak var lowPriceLabel: UILabel!
    @IBOutlet private weak var highPriceLabel: UILabel!
    @IBOutlet private weak var percentagePriceLabel: UILabel!
    @IBOutlet private weak var percentageLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var homeDetailNavigationView: HomeDetailNavigationView!
    
    private let viewModel: HomeDetailViewModel
    
    required init?(coder: NSCoder, viewModel: HomeDetailViewModel) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewWillAppear()
    }

}
//MARK: - HomeViewModelDelegate
extension HomeDetailViewController: HomeDetailViewModelDelegate {
    func configureAfterViewDidLoad() {
        homeDetailNavigationView.configure(coin: viewModel.coin)
        homeDetailNavigationView.delegate = self
        titleLabel.text = "CURRENT PRICE"
        priceLabel.text = viewModel.coin.formattedPrice
        if let changeInNumberValue = viewModel.coin.change.numberValue {
            if changeInNumberValue.isPositive {
                percentagePriceLabel.textColor = .systemGreen
                percentageLabel.textColor = .systemGreen
            }
            else {
                percentagePriceLabel.textColor = .systemRed
                percentageLabel.textColor = .systemRed
            }
            percentagePriceLabel.text = viewModel.coin.changeInPrice
            percentageLabel.text = viewModel.coin.formattedChange
        }
        lowPriceLabel.text = viewModel.coin.formattedLow
        highPriceLabel.text = viewModel.coin.formattedHigh
        highPriceLabel.textColor = .systemGreen
        lowPriceLabel.textColor = .systemRed
    }
    
    func configureAfterViewWillAppear() {}
}
//MARK: - HomeDetailNavigationViewDelegate
extension HomeDetailViewController: HomeDetailNavigationViewDelegate {
    func backButtonDidTapped() {
        navigationController?.popViewController(animated: true)
    }
}
