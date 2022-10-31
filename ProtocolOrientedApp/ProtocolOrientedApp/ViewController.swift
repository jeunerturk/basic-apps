//
//  ViewController.swift
//  ProtocolOrientedApp
//
//  Created by Umut Can Ertürk on 30.10.2022.
//

import UIKit

class ViewController: UIViewController, UserViewModelDelegate {
    func updateView(name: String, email: String, username: String) {
        self.nameLabel.text = name
        self.emailLabel.text = email
        self.usernameLabel.text = username
    }
    
    
    private let viewModel: UserViewModel

    private let nameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private let usernameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private let emailLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        //fetchUser()
        viewModel.fetchUsers()
    }
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.output = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        view.backgroundColor = .systemGray4
        
        view.addSubview(nameLabel)
        view.addSubview(usernameLabel)
        view.addSubview(emailLabel)
        
        emailLabel.text = "Email Label"
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           // nameLabel.heightAnchor.constraint(equalToConstant: 60),
            nameLabel.widthAnchor.constraint(equalToConstant: 200),
            
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //emailLabel.heightAnchor.constraint(equalToConstant: ),
            emailLabel.widthAnchor.constraint(equalToConstant: 200),
        
            usernameLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 20),
            usernameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           // nameLabel.heightAnchor.constraint(equalToConstant: 60),
            usernameLabel.widthAnchor.constraint(equalToConstant: 200),
        
        
        
        
        
        ])
    }
    
    
//    private func fetchUser() {
//        APIManager.shared.fetchUser { result in
//            switch result {
//            case .success(let user):
//                    self.usernameLabel.text = user.username
//                    self.emailLabel.text = user.email
//                    self.nameLabel.text = user.name
//            case .failure:
//                    self.nameLabel.text = "No User Found"
//            }
//        }
//    }

}

