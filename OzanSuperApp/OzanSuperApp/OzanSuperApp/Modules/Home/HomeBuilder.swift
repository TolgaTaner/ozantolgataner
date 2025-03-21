//
//  HomeBuilder.swift
//  OzanSuperApp
//
//  Created by Tolga Taner on 18.03.2025.
//

import UIKit

protocol BuilderProtocol: AnyObject {
    static var storyboard: UIStoryboard { get }
    static var identifier: String { get }
    
    static func create() -> UINavigationController
}

final class HomeBuilder: BuilderProtocol {
    
    static var storyboard: UIStoryboard { UIStoryboard(name: "Main", bundle: nil) }
    static var identifier: String { "HomeViewController" }
    
    static func create() -> UINavigationController {
        let viewModel: HomeViewModel = HomeViewModel()
        let viewController: HomeViewController = storyboard.instantiateViewController(identifier: identifier) { coder in
            return HomeViewController(coder: coder, viewModel: viewModel)
        }
        viewModel.setDelegate(viewController)
        
        let navigationController: UINavigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
    
}
