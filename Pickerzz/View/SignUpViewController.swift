//
//  SignUpViewController.swift
//  Pickerzz
//
//  Created by Bharath on 14/05/25.
//

import UIKit

class SignUpViewController: BaseViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmPassWordTextField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    let signUpViewModel = SignUpViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavBarButton()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpBtn(_ sender: Any) {
        let phoneNumber = phoneNumberTextField.text
        let password = passwordTextField.text
        let confirmPassword = confirmPassWordTextField.text
        let userName = usernameTextField.text
        
        if(!signUpViewModel.missingTextFieldValidation(mobileNumber: phoneNumber, password: password, confirmPassword: confirmPassword, userName: userName)){
            errorLabel.text = "Fill all the Fields"
            return
        }
        
        if(!signUpViewModel.passwordCheckValidation(password: password!, confirmPassword: confirmPassword!)){
            errorLabel.text = "Password doesn't match"
            return
        }
        
        if(!signUpViewModel.mobileNumberValidation(mobileNumber: phoneNumber!)){
            errorLabel.text = "Invalid Mobile Number"
            return
        }
        
        UserDefaultsManager.shared.signUp(user: UserModel(phoneNumber: phoneNumber!, password: password!))
        signUpViewModel.navigatePage(viewController: "LoginPageViewController", navigationController: self.navigationController!)

        
    }
    @IBAction func navLoginBtn(_ sender: Any) {
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginPageViewController")
        self.navigationController?.popViewController(animated: true)
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
}
