//
//  BuilderProtocol.swift
//  OzanSuperApp
//
//  Created by Tolga Taner on 21.03.2025.
//

import UIKit

protocol BuilderProtocol: AnyObject {
    
    associatedtype Module: UIViewController
    static var storyboard: UIStoryboard { get }
    static var identifier: String { get }
    
}
