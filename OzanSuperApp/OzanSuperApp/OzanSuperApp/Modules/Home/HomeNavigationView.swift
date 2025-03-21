//
//  Untitled.swift
//  OzanSuperApp
//
//  Created by Tolga Taner on 19.03.2025.
//

import UIKit

protocol HomeNavigationViewDelegate: AnyObject {
    func pickerDidSelect(_ text: String)
}

final class HomeNavigationView: CustomXibView {
    
    @IBOutlet private weak var pickerTextField: CustomPickerTextField!
    @IBOutlet private weak var titleLabel: UILabel!
    
    weak var delegate: HomeNavigationViewDelegate?
    
    func configure() {
        titleLabel.text = "Ranking List"
        pickerTextField.pickerData = HomeViewModel.FilterType.allCases.map { $0.rawValue }
        pickerTextField.layer.cornerRadius = 17
        pickerTextField.layer.masksToBounds = true
        pickerTextField.pickerDelegate = self
    }
    
    func selectVolumeFilter() {
        pickerTextField.selectSecond()
    }
    
}
extension HomeNavigationView: CustomPickerTextFieldDelegate {
    func didSelect(_ text: String) {
        delegate?.pickerDidSelect(text)
    }
}
