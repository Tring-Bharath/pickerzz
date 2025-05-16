//
//  RegistrationViewModel.swift
//  Pickerzz
//
//  Created by Bharath on 15/05/25.
//

import Foundation
import UIKit


class RegistrationViewModel{
    
    func navigatePage(viewController:String,navigationController:UINavigationController){
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: viewController)
        navigationController.pushViewController(vc, animated: true)
    }
    
    
    func mobileNumberValidation(mobileNumber:String)->Bool{
        
        if(mobileNumber.count == 10){
            return true
        }
        return false
    }
    
}
