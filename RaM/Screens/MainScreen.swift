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
            characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    
    override func configureViews() {
        super.configureViews()
        
    }
    
    func characterListVieww(_ characterListView: CharacterListView, didSelectCharacter character: Character) {
        let viewModel = DetailViewModel(character: character)
        let detailScreen = DetailScreen(viewModel: viewModel)
        detailScreen.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(detailScreen, animated: true)
        
    }
}

