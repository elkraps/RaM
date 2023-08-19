//
//  CharacterViewModel.swift
//  RaM
//
//  Created by Vlad Dzirko on 17.08.2023.
//

import UIKit

protocol CharacterListViewDelegate: AnyObject {
    func didLoadInitialCharacters()
    func didSelectCharacter(_ character: Character)
}

final class CharacterViewModel: NSObject {
    
    public weak var delegate: CharacterListViewDelegate?
    
    private var characters: [Character] = [] {
        didSet {
            for character in characters {
                let viewModel = CharacterCellViewModel(characterName: character.name, characterImage: URL(string: character.image))
                cellViewModels.append(viewModel)
            }
        }
    }
    
    private var cellViewModels: [CharacterCellViewModel] = []
    
    private var apiInfo: CharacterResponse.Info? = nil
    
    public func fetchCharacters() {
        ApiService.shared.makeDataRequest(.listCharacters, expecting: CharacterResponse.self) { [weak self] result in
            switch result {
            case .success(let model):
                let results = model.results
                let info = model.info
                self?.characters = results
                self?.apiInfo = info
                DispatchQueue.main.async {
                    self?.delegate?.didLoadInitialCharacters()
                }  
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
    public func fetchAdditionalCharacters() {
        
    }
    
    public var loadIndicator: Bool {
        return apiInfo?.next != nil
    }
}

extension CharacterViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionViewCell.cellId, for: indexPath) as? CharacterCollectionViewCell else { fatalError("Unsupported cell")}
        let viewModel = cellViewModels[indexPath.row]
        cell.configure(with: viewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width-30)/2
        return CGSize(width: width, height: width * 1.3)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let character = characters[indexPath.row]
        delegate?.didSelectCharacter(character)
    }
}

extension CharacterViewModel: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard loadIndicator else {
            return
        }
    }
}
