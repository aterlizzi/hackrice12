//
//  LoginModel.swift
//  hackrice-app
//
//  Created by Aidan Terlizzi on 9/23/22.
//

import Foundation

// Response from backend should be encoded to this data structure.
struct LoginResponse: Codable {
    var status: Status
    var message: String
}

enum Status: String, Codable {
    case success
    case failure
}


// user signs up --> create new user

// user clicks on door --> check permissions, either open the door or not.
