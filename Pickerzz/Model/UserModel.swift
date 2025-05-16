//
//  UserModel.swift
//  Pickerzz
//
//  Created by Bharath on 14/05/25.
//

import Foundation

class UserModel{
    
    var phoneNumber:String
    var password:String
    
    init(phoneNumber: String, password: String) {
        self.phoneNumber = phoneNumber
        self.password = password
    }
}
