//
//  RootScreen.swift
//  RaM
//
//  Created by Vlad Dzirko on 19.08.2023.
//

import UIKit

final class RootScreen: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpRoot()

    }
    
    func setUpRoot() {
        
        let mainScreen = MainScreen()
        
        let navigationMS = UINavigationController(rootViewController: mainScreen)
        
        setViewControllers([navigationMS], animated: true)

    }

}
