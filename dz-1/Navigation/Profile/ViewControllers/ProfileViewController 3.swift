//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Николай Гринько on 30.01.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    private var modelStarSections: [IProfileSectionModel] = [
        PhotosModel(photos: ["Photos"]),
        ModelStarList(list: Modelstar.starArray())
    ]
    
    
    //MARK: myTableView
    private lazy var myTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .black
        tableView.separatorInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        tableView.sectionHeaderTopPadding = .zero
        tableView.sectionHeaderHeight = .zero
        tableView.sectionFooterHeight = .zero
        tableView.backgroundColor = UIColor.systemGray6
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.noIntrinsicMetric
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Profile"
        setupLayoutConstraints()
    }
    
    //MARK: setupLayoutConstraints
    private func setupLayoutConstraints() {
        
        view.addSubview(myTableView)
        myTableView.tableHeaderView = ProfileHeaderView(frame: CGRect(x: 0, y: 0, width: myTableView.frame.width, height: 210))
        
        NSLayoutConstraint.activate([
            
            myTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            myTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            myTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            myTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

//MARK: Extension UITableViewDataSource
extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return modelStarSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch modelStarSections[section] {
        case is PhotosModel:
            return 1
        case is ModelStarList:
            let modelStarList = modelStarSections[section] as? ModelStarList
            return (modelStarList?.list ?? []).count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch modelStarSections[indexPath.section] {
        case is PhotosModel:
            let cell: PhotosTableViewCell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
            cell.delegate = self
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.shadowOpacity = 0.7
            cell.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
            return cell
        case is ModelStarList:
            let modelStarList = (modelStarSections[indexPath.section] as? ModelStarList)?.list
            if let model: Modelstar = modelStarList?[indexPath.row] {
                let cell: PostTableViewCell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
                cell.configureCell(model: model, indexPath: indexPath)
                cell.onLikeTapped = { [ weak self ] likes, indexPath in
                    self?.updateModelItem(likes: likes, indexPath: indexPath)
                }
                
                return cell
            } else { return UITableViewCell() }
        default:
            return UITableViewCell()
        }
    }
    
    func updateModelItem(likes: Int, indexPath: IndexPath) {
        var list = (modelStarSections[indexPath.section] as? ModelStarList)?.list ?? []
        var model = list[indexPath.row]
        model.likes = likes
        list[indexPath.row] = model
        modelStarSections[indexPath.section] = ModelStarList(list: list)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
}

//MARK: Extension UITableViewDelegate
extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return indexPath.section == 1
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if indexPath.section == 1 && editingStyle == .delete {
            var list = (modelStarSections[indexPath.section] as? ModelStarList)?.list ?? []
            list.remove(at: indexPath.row)
            modelStarSections[indexPath.section] = ModelStarList(list: list)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let list = (modelStarSections[indexPath.section] as? ModelStarList)?.list
        if var model: Modelstar = list?[indexPath.row] {
            let detailVC = DetailedViewController()
            model.views += 1
            detailVC.viewsLabel.text = "Views: \(model.views)"
            detailVC.likesLabel.text = "Likes: \(model.likes)"
            detailVC.myImageView.image = UIImage(named: model.image)
            detailVC.descriptionLabel.text = model.description
            detailVC.authorLabel.text = model.author
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}

//MARK: Extension IPhotosTableViewCellDelegate
extension ProfileViewController: IPhotosTableViewCellDelegate {
    @objc internal func galleryButtonActions() {
        let photosVC = PhotosViewController()
        navigationController?.pushViewController(photosVC, animated: true)
        
    }
}










