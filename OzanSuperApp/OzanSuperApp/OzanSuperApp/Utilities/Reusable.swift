//
//  Reusable.swift
//  OzanSuperApp
//
//  Created by Tolga Taner on 20.03.2025.
//

import Foundation

protocol Reusable {
  static var identifier: String { get }
}

extension Reusable {
  static var identifier: String {
    String(describing: self)
  }
}

