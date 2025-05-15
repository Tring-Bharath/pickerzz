//
//  LoginPageViewController.swift
//  Pickerzz
//
//  Created by Bharath on 14/05/25.
//

import UIKit

class LoginPageViewController: BaseViewController {

    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var phoneNumber: UIView!
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var errorLabelHeightConstraint: NSLayoutConstraint!
    
    let loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavBarButton()
    }
    
    @IBAction func backButton(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        
        guard let phoneNumber = phoneNumberTextField.text else{
            return
        }
        
        if(!loginViewModel.mobileNumberValidation(mobileNumber: phoneNumber)){
            showError(message: "Invalid Mobile Number")
            return
        }
        
        guard let phoneNumber = phoneNumberTextField.text, let password = passwordTextField.text else{
            return
        }

        if(UserDefaultsManager.shared.loginUser(user: UserModel(phoneNumber: phoneNumber, password: password))){
            let pickerzzVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController")
            let pickerzzNavVC = UINavigationController(rootViewController: pickerzzVC)
            pickerzzNavVC.modalPresentationStyle = .fullScreen
            self.present(pickerzzNavVC, animated: true)
        }
        else{
            showError(message: "Invalid Phone Number or Password")
        }
    }
    
    @IBAction func navSignUpBtn(_ sender: Any) {
        let signUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpViewController")
        self.navigationController?.popViewController(animated: true)
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    func showError(message: String) {
        UIView.animate(withDuration: 0.3) {
            self.errorLabelHeightConstraint.constant = 25
            self.errorLabel.text = message
            self.view.layoutIfNeeded()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: {
            self.hideError()
        })
    }
    
    func hideError() {
        UIView.animate(withDuration: 0.3) {
            self.errorLabelHeightConstraint.constant = 0
            self.errorLabel.text = ""
            self.view.layoutIfNeeded()
        }
    }
    
}
