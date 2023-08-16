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

enum NavBarPosition {
    case left
    case right
}

@objc extension BaseController {
    
    func setupViews() {
        
    }
    
    func constraintViews() {
        
    }
    
    func configureViews() {
        
        view.backgroundColor = Resources.Colors.mainBackground
    }
    
    func navBarLeftButtonHandler() {
        print("NavBar left button tapped")
    }

    func navBarRightButtonHandler() {
        print("NavBar right button tapped")
    }
}

