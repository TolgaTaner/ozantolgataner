//
//  HomeDetailBuilder.swift
//  OzanSuperApp
//
//  Created by Tolga Taner on 21.03.2025.
//

import UIKit

final class HomeDetailBuilder: BuilderProtocol {
    
    typealias Module = HomeDetailViewController
    
    static var storyboard: UIStoryboard { UIStoryboard(name: "Main", bundle: nil) }
    static var identifier: String { "HomeDetailViewController" }
    
    static func create(_ coin: Coin) -> Module {
        let viewModel: HomeDetailViewModel = HomeDetailViewModel(coin: coin)
        let viewController: HomeDetailViewController = storyboard.instantiateViewController(identifier: identifier) { coder in
            return HomeDetailViewController(coder: coder, viewModel: viewModel)
        }
        viewModel.setDelegate(viewController)
        return viewController
    }
    
}
