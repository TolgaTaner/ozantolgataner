//
//  BaseViewModelDelegate.swift
//  OzanSuperApp
//
//  Created by Tolga Taner on 18.03.2025.
//

import Foundation

protocol BaseViewModelDelegate: AnyObject {
    func configureAfterViewDidLoad()
    func configureAfterViewWillAppear()
}
