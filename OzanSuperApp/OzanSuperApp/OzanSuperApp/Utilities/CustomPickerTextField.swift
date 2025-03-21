//
//  CustomPickerTextField.swift
//  OzanSuperApp
//
//  Created by Tolga Taner on 21.03.2025.
//

import UIKit

protocol CustomPickerTextFieldDelegate: AnyObject {
    func didSelect(_ text: String)
}

final class CustomPickerTextField: UITextField, UIPickerViewDelegate, UIPickerViewDataSource {

    var pickerData: [String] = [] {
        didSet {
            pickerView.reloadAllComponents()
        }
    }

    private let pickerView = UIPickerView()
    weak var pickerDelegate: CustomPickerTextFieldDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        pickerView.delegate = self
        pickerView.dataSource = self
        inputView = pickerView
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneDidTapped))
        toolbar.setItems([doneButton], animated: false)
        
        inputAccessoryView = toolbar
    }

    @objc private func doneDidTapped() {
        resignFirstResponder()
        let selectedIndex = pickerView.selectedRow(inComponent: 0)
        if pickerData.indices.contains(selectedIndex) {
            let selectedItem = pickerData[selectedIndex]
            text = selectedItem
            pickerDelegate?.didSelect(text ?? String())
        }
    }
    
    func selectFirst() {
        DispatchQueue.main.async {
            self.pickerView(self.pickerView, didSelectRow: 0, inComponent: 0)
            self.pickerView.selectRow(0, inComponent: 0, animated: false)
            self.pickerView.reloadAllComponents()
        }
        pickerDelegate?.didSelect(text ?? String())
    }

    // MARK: - UIPickerViewDataSource & Delegate
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerData.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        pickerData[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        text = pickerData[row]
    }
}
