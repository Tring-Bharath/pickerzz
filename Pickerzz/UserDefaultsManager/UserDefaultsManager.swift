//
//  UserDefaultsManager.swift
//  Pickerzz
//
//  Created by Bharath on 14/05/25.
//

import Foundation


class UserDefaultsManager{
    
    static let shared = UserDefaultsManager()
    
    func signUp(user:UserModel){
        UserDefaults.standard.set(user.password, forKey: user.phoneNumber)
    }
    
    func loginUser(user:UserModel)->Bool{
        if let userPassword = UserDefaults.standard.string(forKey: user.phoneNumber){
            return userPassword == user.password ? true :false
            
        }
        return false
    }
}
