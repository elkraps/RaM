//
//  AppDelegate.swift
//  RaM
//
//  Created by Vlad Dzirko on 16.08.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    private var splashPresenter: SplashPresenterDescription? = SplashViewModel()
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        splashPresenter?.present()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.splashPresenter?.dismiss { [weak self] in
                self?.splashPresenter = nil
            }
        }
        return true
    }

}

