//
//  LaunchScreen.swift
//  RaM
//
//  Created by Vlad Dzirko on 21.08.2023.
//

import UIKit

final class LaunchScreen: BaseController {
    
    private let logoImage = UIImageView()
    private let holeImage = UIImageView()
    private let starsImage = UIImageView()
}

extension LaunchScreen {
    override func setupViews() {
        super.setupViews()
        view.addView(logoImage)
        view.addView(holeImage)
        view.addView(starsImage)
        
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            
            starsImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            starsImage.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            starsImage.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            starsImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 164),
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            holeImage.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 36),
            holeImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)

            
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
        view.backgroundColor = Resources.Colors.mainBackground
        logoImage.image = Resources.Images.Splash.logo
        holeImage.image = Resources.Images.Splash.hole
        starsImage.image = Resources.Images.Splash.stars
    }
}
