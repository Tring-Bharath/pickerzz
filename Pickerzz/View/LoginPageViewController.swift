//
//  LoginPageViewController.swift
//  Pickerzz
//
//  Created by Bharath on 14/05/25.
//

import UIKit

class LoginPageViewController: UIViewController {

    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var phoneNumber: UIView!
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        let backBtn:UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .done, target: self, action: #selector(backBtnAction))
        self.navigationItem.setLeftBarButton(backBtn, animated: true)
    }
    @IBAction func backButton(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func backBtnAction(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        
        
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
            errorLabel.text = "Invalid Phone Number or Password"
        }
    }
    
    @IBAction func navSignUpBtn(_ sender: Any) {
        let signUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpViewController")
        self.navigationController?.popViewController(animated: true)
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
    
}
