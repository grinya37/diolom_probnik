//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Николай Гринько on 28.02.2023.
//
//
import UIKit

protocol IPhotoCellDelegate: AnyObject {
    func tapAction(photo: UIImage)
   
}
final class CollectionViewCell: UICollectionViewCell {
    
    weak var buttonAllPhotoCellDelegate: IPhotoCellDelegate?
    
    //MARK: Add collectionImageView
    lazy var collectionImageView: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 5
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.systemGray6
        setupLayout()
        gustomizeGestureTap()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: gustomizeGestureTap
    private func gustomizeGestureTap() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(photoAction))
        collectionImageView.isUserInteractionEnabled = true
        collectionImageView.addGestureRecognizer(tapGesture)
    }
    
    func setupImageModel(_ image: ImageGallery) {
        collectionImageView.image = UIImage(named: image.image)
    }
    // MARK: photoAction
    @objc private func photoAction() {
        buttonAllPhotoCellDelegate?.tapAction(photo: collectionImageView.image!)
    }
    
    //MARK: setupLayout
    private func setupLayout() {
        contentView.addSubview(collectionImageView)
        
        NSLayoutConstraint.activate ([
            collectionImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

