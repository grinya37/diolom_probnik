//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Николай Гринько on 30.01.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    private var topInsetView = UIView()
    
    private var modelStar: [Modelstar] = Modelstar.starArray()

    private lazy var myTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayoutConstraints()
        navigationItem.title = "post"
        topInsetView.backgroundColor = .systemMint
        view.addSubview(topInsetView)
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        topInsetView.frame = CGRect(x: 0, y: 0,
                                    width: view.frame.width,
                                    height: view.safeAreaInsets.top)
    }
    
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

extension ProfileViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        modelStar.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
        cell.setupCell(model: modelStar[indexPath.row])
        return cell
    }
}

extension ProfileViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            modelStar.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}











