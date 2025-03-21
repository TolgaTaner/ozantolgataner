//
//  CustomXibView.swift
//  OzanSuperApp
//
//  Created by Tolga Taner on 19.03.2025.
//

import UIKit

class CustomXibView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        let view = loadViewFromNib()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            view.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func loadViewFromNib() -> UIView {
        let bundle =  Bundle(for: self.classForCoder)
        return UINib(nibName: Self.identifier, bundle: bundle).instantiate(withOwner: self, options: nil)[0] as! UIView
    }
}
