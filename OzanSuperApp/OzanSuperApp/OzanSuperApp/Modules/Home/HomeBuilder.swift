//
//  HomeBuilder.swift
//  OzanSuperApp
//
//  Created by Tolga Taner on 18.03.2025.
//

import UIKit

final class HomeBuilder: BuilderProtocol {
    
    typealias Module = UINavigationController
    static var storyboard: UIStoryboard { UIStoryboard(name: "Main", bundle: nil) }
    static var identifier: String { "HomeViewController" }
    
    static func create() -> Module {
        let viewModel: HomeViewModel = HomeViewModel()
        let viewController: HomeViewController = storyboard.instantiateViewController(identifier: identifier) { coder in
            return HomeViewController(coder: coder, viewModel: viewModel)
        }
        viewModel.setDelegate(viewController)
        
        let navigationController: UINavigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
    
}
