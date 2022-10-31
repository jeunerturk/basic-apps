//
//  APIManager.swift
//  ProtocolOrientedApp
//
//  Created by Umut Can Ertürk on 30.10.2022.
//

import Foundation

protocol UserService {
    func fetchUser(completion: @escaping(Result<User, Error>) -> Void)
}

class APIManager: UserService {
    
    // MARK: Singleton Pattern
    static let shared = APIManager()
   // private init () {}
    
    // MARK: Networking
    func fetchUser(completion: @escaping(Result<User, Error>) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            print("wtf")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            DispatchQueue.main.async {
                if let user = try? JSONDecoder().decode([User].self, from: data).first {
                    completion(.success(user))
                } else {
                    completion(.failure(NSError()))
                }
            }
            
            
            
        }.resume()
    }
    
}
