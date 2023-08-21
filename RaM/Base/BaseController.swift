//
//  BaseController.swift
//  RaM
//
//  Created by Vlad Dzirko on 16.08.2023.
//

import UIKit

class BaseController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        constraintViews()
        configureViews()
    }
}


@objc extension BaseController {
    
    func setupViews() {}
    
    func constraintViews() {}
    
    func configureViews() {
        view.backgroundColor = .white
    }
}

