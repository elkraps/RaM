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
        hideTabBar()
    }
    
    func setUpRoot() {
        let mainScreen = MainScreen()
        
        let navigationMS = UINavigationController(rootViewController: mainScreen)
        
        setViewControllers([navigationMS], animated: true)
    }
    
    func hideTabBar() {
        guard let firstViewController = self.viewControllers?.first as? RootScreen else {
            return
        }
        
        DispatchQueue.main.async {
            self.tabBar.isHidden = true
            firstViewController.view.frame.size.height = UIScreen.main.bounds.size.height
        }
    }
}
