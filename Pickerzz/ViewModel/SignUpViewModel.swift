//
//  signUpViewModel.swift
//  Pickerzz
//
//  Created by Bharath on 15/05/25.
//

import Foundation


class SignUpViewModel:RegistrationViewModel{
    
    func missingTextFieldValidation(mobileNumber:String?,password:String?,confirmPassword:String?,userName:String?)->Bool{
        guard let _ = mobileNumber,let _ = password,let _ = confirmPassword,let _ = userName else{
            return false
        }
        
        if(mobileNumber?.count == 0 || password?.count == 0 || confirmPassword?.count == 0 || userName?.count == 0){
            return false
        }
        return true
    }
    
    func passwordCheckValidation(password:String,confirmPassword:String)->Bool{
        
        if(password == confirmPassword)
        {
            return true
        }
        return false
    }
    

}
