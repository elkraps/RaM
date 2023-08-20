//
//  MainScreen.swift
//  RaM
//
//  Created by Vlad Dzirko on 16.08.2023.
//

import UIKit
import SwiftUI

class MainScreen: BaseController{

    private let characterListView = CharacterListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Characters"
    }


}

extension MainScreen: CharactersListViewDelegate {
    
    override func setupViews() {
        super.setupViews()
        view.addView(characterListView)
        characterListView.delegate = self
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            characterListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            characterListView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    
    override func configureViews() {
        super.configureViews()
        
        
        tabBarController?.tabBar.isHidden = true
        self.navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.backgroundColor = .clear
//        navigationController?.navigationBar.layer.opacity = 0.3
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        navigationController?.navigationBar.shadowImage = UIImage()
//        navigationController?.navigationBar.isTranslucent = true
    }
    
    func characterListVieww(_ characterListView: CharacterListView, didSelectCharacter character: Character) {
        let viewModel = CharacterDetailViewModel()
        let detailScreen = DetailScreen(characters: character, detailViewModel: viewModel)
        let vc = UIHostingController(rootView: detailScreen)
        navigationController?.pushViewController(vc, animated: true)
        
    }
}

