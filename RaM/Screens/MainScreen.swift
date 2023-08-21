//
//  MainScreen.swift
//  RaM
//
//  Created by Vlad Dzirko on 16.08.2023.
//

import UIKit
import SwiftUI

class MainScreen: BaseController{

    
    private let charText: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private let characterListView = CharacterListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        title = "CHARACTERS"
        
    }


}

extension MainScreen: CharactersListViewDelegate {
    
    override func setupViews() {
        super.setupViews()
        view.addView(characterListView)
        view.addView(charText)
        characterListView.delegate = self
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            
            charText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            charText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            
            characterListView.topAnchor.constraint(equalTo: charText.bottomAnchor, constant: 31),
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

        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        charText.text = "Characters"
        
        
        view.backgroundColor = Resources.Colors.mainBackground
    }
    
    func characterListVieww(_ characterListView: CharacterListView, didSelectCharacter character: Character) {
        let viewModel = CharacterDetailViewModel()
        let detailScreen = DetailScreen(characters: character, detailViewModel: viewModel)
        let vc = UIHostingController(rootView: detailScreen)
        navigationController?.pushViewController(vc, animated: true)
        
    }
}

