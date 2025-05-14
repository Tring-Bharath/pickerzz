//
//  LoginPageViewController.swift
//  Pickerzz
//
//  Created by Bharath on 14/05/25.
//

import UIKit

class LoginPageViewController: UIViewController {

    
    @IBOutlet weak var phoneNumber: UIView!
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        
        
        guard let phoneNumber = phoneNumberTextField.text, let password = passwordTextField.text else{
            return
        }

        if(UserDefaultsManager.shared.loginUser(user: UserModel(phoneNumber: phoneNumber, password: password))){
            let pickerzzVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController")
            self.navigationController?.pushViewController(pickerzzVC, animated: true)
        }
        else{
            print("Login Unsucessful")
        }
    }
    
    @IBAction func navSignUpBtn(_ sender: Any) {
        let signUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpViewController")
        self.navigationController?.popViewController(animated: true)
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
    
}
