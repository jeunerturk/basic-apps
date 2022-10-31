//
//  UserViewModel.swift
//  ProtocolOrientedApp
//
//  Created by Umut Can Ertürk on 31.10.2022.
//

import Foundation


class UserViewModel {
    
    private let userService: UserService
    weak var output: UserViewModelDelegate?
    
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    
    func fetchUsers() {
        userService.fetchUser { [weak self] result in
            switch result {
            case .success(let user):
                self?.output?.updateView(name: user.name, email: user.email, username: user.username)
            case .failure(_):
                self?.output?.updateView(name: "No user found", email: "", username: "")
            }
        }
    }
}
