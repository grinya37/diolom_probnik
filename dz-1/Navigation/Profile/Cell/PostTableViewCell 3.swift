//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Николай Гринько on 26.02.2023.
//

import UIKit


final class PostTableViewCell: UITableViewCell {
    var onLikeTapped: ((Int, IndexPath) -> ())?
    var onEyeTapped: ((Int, IndexPath) -> ())?
    
    //MARK: - Add authorLabel
    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Add myImageView
    private lazy var myImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .black
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Add descriptionLabel
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor.black
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Add likesLabel
    private lazy var likesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        return label
    }()
    
    //MARK: - Add viewsLabel
    private lazy var viewsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: heartImage
    private let heartImage: UIImageView = {
        let heartImage = UIImageView(image: UIImage(systemName: "suit.heart.fill"))
        heartImage.tintColor = .systemGray
        heartImage.contentMode = .scaleAspectFit
        heartImage.translatesAutoresizingMaskIntoConstraints = false
        return heartImage
    }()
    
    //MARK: eyeImage
    private let eyeImage: UIImageView = {
        let heartImage = UIImageView(image: UIImage(systemName: "eye.fill"))
        heartImage.tintColor = .systemGray
        heartImage.contentMode = .scaleAspectFit
        heartImage.translatesAutoresizingMaskIntoConstraints = false
        return heartImage
    }()
 
    
    var viewsCount: Int? {
        didSet {
            viewsLabel.text = "Views: \(viewsCount ?? 0 )"
        }
    }

    var likesCount: Int? {
        didSet {
            likesLabel.text = "Likes: \(likesCount ?? 0 )"
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.black
        setupLayout()
        setupTapGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private var isHeartSelected = false
    private var isEyeSelected = false
    private var indexPath = IndexPath(index:0)
   
    
    //MARK: configureCell
    func configureCell(model: Modelstar, indexPath: IndexPath) {
        authorLabel.text = model.author
        myImageView.image = UIImage(named: model.image)
        descriptionLabel.text = model.description
        likesLabel.text = "Likes: \(model.likes)"
        viewsLabel.text = "Views: \(model.views)"
        isHeartSelected = model.isLiked
        isEyeSelected = model.eyeViews
        heartImage.tintColor = model.isLiked ? .systemPink : .systemGray
        viewsCount = model.views
        likesCount = model.likes
        self.indexPath = indexPath
    }
    
    
    //MARK: setupTapGesture
    private func setupTapGesture() {
        likesLabel.isUserInteractionEnabled = true
        let unshapeAgesture = UITapGestureRecognizer(target: self, action: #selector(likesLabelTapAction))
        likesLabel.addGestureRecognizer(unshapeAgesture)

        let gestureTap = UITapGestureRecognizer(target: self, action: #selector(handleHeartTap))
        heartImage.addGestureRecognizer(gestureTap)
        heartImage.isUserInteractionEnabled = true
    }

    @objc private func likesLabelTapAction() {
        var likesCount = Int(likesLabel.text?.replacingOccurrences(of: "Likes: ", with: "") ?? "0") ?? 0
        if isHeartSelected {
            likesCount -= 1
            UIView.animate(withDuration: 0.2) {
                self.heartImage.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            } completion: { _ in
                self.heartImage.transform = .identity
            }
            heartImage.tintColor = .systemGray
        } else {
            likesCount += 1
            UIView.animate(withDuration: 0.2) {
                self.heartImage.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            } completion: { _ in
                UIView.animate(withDuration: 0.2) {
                    self.heartImage.transform = .identity
                }
            }
            heartImage.tintColor = .systemPink
        }
        likesLabel.text = "Likes: \(likesCount)"
        onLikeTapped?(likesCount, indexPath)
        isHeartSelected.toggle()
    }

    @objc private func handleHeartTap() {
        var likesCount = Int(likesLabel.text?.replacingOccurrences(of: "Likes: ", with: "") ?? "0") ?? 0
        if isHeartSelected {
            likesCount -= 1
            UIView.animate(withDuration: 0.2) {
                self.heartImage.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            } completion: { _ in
                self.heartImage.transform = .identity
            }
            heartImage.tintColor = .systemGray
        } else {
            likesCount += 1
            UIView.animate(withDuration: 0.2) {
                self.heartImage.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            } completion: { _ in
                UIView.animate(withDuration: 0.2) {
                    self.heartImage.transform = .identity
                }
            }
            heartImage.tintColor = .systemPink
        }
        likesLabel.text = "Likes: \(likesCount)"
        isHeartSelected.toggle()
    }

    
    //MARK: - setupLayout
    private func setupLayout() {
        
        [myImageView,
         authorLabel,
         descriptionLabel,
         likesLabel,
         heartImage,
         eyeImage,
         viewsLabel].forEach { contentView.addSubview( $0 ) }
        contentView.backgroundColor = .systemGray5
        contentView.layer.borderWidth = 0
        let inset: CGFloat = 16

        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),

            myImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: inset),
            myImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -0.5),
            myImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0.5),
            myImageView.heightAnchor.constraint(equalToConstant: 300),

            descriptionLabel.topAnchor.constraint(equalTo: myImageView.bottomAnchor, constant: inset),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),

            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 30),
            likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            likesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),

            heartImage.centerYAnchor.constraint(equalTo: likesLabel.centerYAnchor),
            heartImage.leadingAnchor.constraint(equalTo: likesLabel.leadingAnchor, constant: -22),
            heartImage.widthAnchor.constraint(equalToConstant: 20),
            heartImage.heightAnchor.constraint(equalToConstant: 20),

            eyeImage.centerYAnchor.constraint(equalTo: viewsLabel.centerYAnchor),
            eyeImage.leadingAnchor.constraint(equalTo: viewsLabel.leadingAnchor, constant: -22),
            
            eyeImage.widthAnchor.constraint(equalToConstant: 20),
            eyeImage.heightAnchor.constraint(equalToConstant: 20),
            
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: inset),
            viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset),
        ])
    }
}

