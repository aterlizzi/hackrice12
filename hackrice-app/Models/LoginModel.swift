//
//  LoginModel.swift
//  hackrice-app
//
//  Created by Aidan Terlizzi on 9/23/22.
//

import Foundation

// Response from backend should be encoded to this data structure.
struct LoginResponse: Codable {
    var status: String?
    var message: String?
}


// user signs up --> create new user

// user clicks on door --> check permissions, either open the door or not.
