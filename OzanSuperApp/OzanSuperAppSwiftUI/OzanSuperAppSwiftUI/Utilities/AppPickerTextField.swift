//
//  PickerTextField.swift
//  OzanSuperAppSwiftUI
//
//  Created by Tolga Taner on 27.03.2025.
//

import SwiftUI

protocol PickerTextFieldDelegate {
    func didSelect(_ selectedItem: String)
}

protocol PickerActionDelegate {
    func doneButtonDidTapped()
}

struct AppPickerTextField: UIViewRepresentable, PickerTextFieldDelegate, PickerActionDelegate {
   
    typealias UIViewType = AppTextField
    
    private let textField: AppTextField = AppTextField()
    private let pickerView: UIPickerView = UIPickerView()
    private let action: Action
    private let doneButtonTitle: String
    var data: [String]
    
    @State var lastSelectedItem: String?
    
    init(data: [String], doneButtonTitle: String) {
        self.data = data
        self.doneButtonTitle = doneButtonTitle
        action = Action()
    }
    
    func makeUIView(context: Context) -> AppTextField {
        pickerView.delegate = context.coordinator
        pickerView.dataSource = context.coordinator
        textField.inputView = pickerView
        textField.borderStyle = .roundedRect
        textField.textContentType = .none
        action.setDelegate(self)
        let toolbar: UIToolbar = UIToolbar()
        let flexibleSpace: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                                             target: nil,
                                                             action: nil)
        let doneButton: UIBarButtonItem = UIBarButtonItem(title: doneButtonTitle,
                                                          style: .plain,
                                                          target: action,
                                                          action: #selector(Action.doneDidTapped))
        toolbar.setItems([flexibleSpace, doneButton], animated: true)
        textField.inputAccessoryView = toolbar
        let imageView = UIImageView(image: UIImage(systemName: "chevron.down"))
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 30))
        imageView.frame = CGRect(x: 5, y: 3, width: 24, height: 24)

        // UIView içine ImageView'ı ekle
        paddingView.addSubview(imageView)
        textField.rightView = paddingView
        textField.rightViewMode = .always
        return textField
    }
    
    func updateUIView(_ uiView: AppTextField, context: Context) {
        uiView.text = lastSelectedItem
    }
    
    func didSelect(_ selectedItem: String) {
        lastSelectedItem = selectedItem
    }
    
    func doneButtonDidTapped() {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(data: data, delegate: self)
    }
    
    final class Action {
        
        private var delegate: PickerActionDelegate?
        
        func setDelegate(_ delegate: PickerActionDelegate) {
            self.delegate = delegate
        }
        
        @objc func doneDidTapped() {
            delegate?.doneButtonDidTapped()
        }
    }
    
    final class Coordinator: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
        private var data: [String]
        private var delegate: PickerTextFieldDelegate
        
        init(data: [String],
             delegate: PickerTextFieldDelegate) {
            self.data = data
            self.delegate = delegate
        }
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            data.count
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            data[row]
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            delegate.didSelect(data[row])
        }
    }
    
}
