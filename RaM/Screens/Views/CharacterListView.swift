//
//  CharacterListView.swift
//  RaM
//
//  Created by Vlad Dzirko on 17.08.2023.
//

import UIKit

protocol CharactersListViewDelegate: AnyObject {
    func characterListVieww(_ characterListView: CharacterListView, didSelectCharacter character: Character)
}

final class CharacterListView: BaseView {
    
    public weak var delegate: CharactersListViewDelegate?
    
    private let viewModel = CharacterViewModel()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.backgroundColor = .clear
        collectionView.isHidden = true
        collectionView.alpha = 0
        collectionView.register(CharacterCollectionViewCell.self, forCellWithReuseIdentifier: CharacterCollectionViewCell.cellId)
                return collectionView
    }()
}

extension CharacterListView: CharacterListViewDelegate {
    
    override func setupViews() {
        super.setupViews()
        
        addView(spinner)
        addView(collectionView)
        
        spinner.startAnimating()
        viewModel.delegate = self
        viewModel.fetchCharacters()
        
        setupCollectionView()
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = viewModel
        collectionView.delegate = viewModel
    }
    
    func didLoadInitialCharacters() {
        spinner.stopAnimating()
        collectionView.isHidden = false
        collectionView.reloadData()
        UIView.animate(withDuration: 0.4) {
            self.collectionView.alpha = 1
        }
//        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
//            self.
//
//            self.
//
//
//        })
    }
    
    func didSelectCharacter(_ character: Character) {
        delegate?.characterListVieww(self, didSelectCharacter: character)
    }
    
}
