//
//  CollectionViewCellTableView.swift
//  Navigation
//
//  Created by Николай Гринько on 21.03.2023.
//
import UIKit


final class CollectionViewCellT: UICollectionViewCell {
    
    // MARK: - myImageView
    private lazy var myImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.systemGray6
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: setupImageModel
    func setupImageModel(_ image: ImageGallery) {
        myImageView.image = UIImage(named: image.image)
    }
    
    // MARK: setupLayout
    private func setupLayout() {
        contentView.addSubview(myImageView)
        
        NSLayoutConstraint.activate([
            myImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
            myImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            myImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2),
            myImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}

