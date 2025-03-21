//
//  ViewController.swift
//  OzanSuperApp
//
//  Created by Tolga Taner on 18.03.2025.
//

import UIKit

protocol HomeViewControllerDelegate: BaseViewControllerDelegate {
    var coins: [Coin] { get set }
    
    func getRanking()
    func getCoin(atRow row: Int) -> Coin
    func filter(byType type: HomeViewModel.FilterType)
}

final class HomeViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var homeNavigationView: HomeNavigationView!
    
    private let viewModel: HomeViewModel
    
    required init?(coder: NSCoder, viewModel: HomeViewModel) {
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
//MARK: - Alertable
extension HomeViewController: Alertable { }
//MARK: - HomeViewModelDelegate
extension HomeViewController: HomeViewModelDelegate {
    
    func fetchedCoinsSuccessfully() {
        homeNavigationView.selectVolumeFilter()
    }
    
    func fetchedCoinsFailed(_ error: any Error) {
        showAlert(title: "Ozan", message: "Bir sorun ile karşılaşıldı.")
    }
    
    func configureAfterViewDidLoad() {
        collectionView.dataSource = self
        collectionView.delegate = self
        homeNavigationView.delegate = self
        collectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "HomeCollectionViewCell")
        homeNavigationView.configure()
        viewModel.getRanking()
    }
    
    func configureAfterViewWillAppear() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func filterDidFinished(_ type: HomeViewModel.FilterType) {
        collectionView.reloadData()
    }
}
//MARK: - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.coins.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as? HomeCollectionViewCell {
            let coin = viewModel.getCoin(atRow: indexPath.row)
            cell.configure(coin)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.bounds.width - 20, height: 85)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let coin = viewModel.coins[indexPath.row]
    }
    
}
//MARK: - HomeNavigationViewDelegate
extension HomeViewController: HomeNavigationViewDelegate {
    func pickerDidSelect(_ text: String) {
        viewModel.filter(byType: HomeViewModel.FilterType(rawValue: text) ?? .volume)
    }
}
