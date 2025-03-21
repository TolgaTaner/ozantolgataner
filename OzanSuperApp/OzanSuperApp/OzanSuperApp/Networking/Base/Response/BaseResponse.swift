//
//  BaseResponse.swift
//  OzanSuperApp
//
//  Created by Tolga Taner on 19.03.2025.
//

import Foundation

struct BaseResponse<T: Model>: Model {
    let status: String
    let data: T
}
