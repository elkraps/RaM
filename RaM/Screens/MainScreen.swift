//
//  MainScreen.swift
//  RaM
//
//  Created by Vlad Dzirko on 16.08.2023.
//

import UIKit

class MainScreen: BaseController {

    private let characterListView = CharacterListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Characters"
        
        
    }


}

extension MainScreen {
    override func setupViews() {
        super.setupViews()
        view.addView(characterListView)
        
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            characterListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    
    override func configureViews() {
        super.configureViews()
        
    }
    
}

