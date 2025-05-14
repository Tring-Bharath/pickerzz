//
//  SignUpViewController.swift
//  Pickerzz
//
//  Created by Bharath on 14/05/25.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmPassWordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signUpBtn(_ sender: Any) {
        if(passwordTextField.text == confirmPassWordTextField.text){
            
            guard let phoneNumber = phoneNumberTextField.text , let password = passwordTextField.text else{
                print("text Field is Empty")
                return
            }

            UserDefaultsManager.shared.signUp(user: UserModel(phoneNumber: phoneNumber, password: password))
            let pickerzzVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController")
            self.navigationController?.pushViewController(pickerzzVC, animated: true)
        }
        else{
            print("password doesn't match")
        }
        
    }
    @IBAction func navLoginBtn(_ sender: Any) {
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginPageViewController")
        self.navigationController?.popViewController(animated: true)
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
}
