//
//  CharacterCollectionViewCell.swift
//  RaM
//
//  Created by Vlad Dzirko on 17.08.2023.
//

import UIKit

final class CharacterCollectionViewCell: UICollectionViewCell {
    static let cellId = "CharacterCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.numberOfLines = 0
        label.textColor = Resources.Colors.mainFontColor
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        constraintViews()
        configureViews()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        
        setupViews()
        constraintViews()
        configureViews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        nameLabel.text = nil
    }
    
}

private extension CharacterCollectionViewCell {
    
    func setupViews() {
        addView(imageView)
        addView(nameLabel)
    }
    
    func constraintViews() {
        NSLayoutConstraint.activate([
            nameLabel.heightAnchor.constraint(equalToConstant: 22),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 29),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -29),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            imageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -16),
            
//            imageView.heightAnchor.constraint(equalToConstant: 140),
//            imageView.widthAnchor.constraint(equalToConstant: 140)
            
            
        ])
    }
    
    func configureViews() {
        backgroundColor = Resources.Colors.backgoundCells
        layer.cornerRadius = 15
    }
    
    public func configure(with viewModel: CharacterCellViewModel) {
        nameLabel.text = viewModel.characterName
        viewModel.fetchImage { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.imageView.image = image
                }
            case .failure(let err):
                print(String(describing: err))
                break
            }
        }
    }
    
}
