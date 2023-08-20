//
//  BaseView.swift
//  RaM
//
//  Created by Vlad Dzirko on 16.08.2023.
//

import UIKit

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        constraintViews()
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        constraintViews()
        configureViews()
    }
    
    
}

@objc extension BaseView {
    func setupViews() {}
    func constraintViews() {}
    func configureViews() {}
}
