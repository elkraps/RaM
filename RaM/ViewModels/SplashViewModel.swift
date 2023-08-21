//
//  SplashViewModel.swift
//  RaM
//
//  Created by Vlad Dzirko on 21.08.2023.
//

import UIKit

protocol SplashPresenterDescription {
    func present()
    func dismiss(completion: @escaping () -> Void)
}

final class SplashViewModel: SplashPresenterDescription {
    
    private lazy var splashWindow: UIWindow = {
        let splashWindow = UIWindow()
        
        let view = LaunchScreen()
//        let splashViewController = view
        
        splashWindow.windowLevel = .normal + 1
        splashWindow.rootViewController = view
        
        return splashWindow
    }()
    
    func present() {
        splashWindow.isHidden = false
    }
    
    func dismiss(completion: @escaping () -> Void) {
//        guard let window = UIApplication.shared.delegate?.window, let mainWindow = window else { fatalError("App delegate do not have a window")}
        
        self.splashWindow.alpha = 0
        
        
//        let mask = CALayer()
//        mask

    }

}
