//
//  UserViewModelDelegate.swift
//  ProtocolOrientedApp
//
//  Created by Umut Can Ertürk on 1.11.2022.
//

import Foundation

protocol UserViewModelDelegate : AnyObject {
    func updateView(name: String, email: String, username: String)
}
