//
//  FirstPageViewController.swift
//  Pickerzz
//
//  Created by Bharath on 14/05/25.
//

import UIKit

class FirstPageViewController: UIViewController {

    let viewModel = RegistrationViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        viewModel.navigatePage(viewController: "LoginPageViewController", navigationController: self.navigationController!)
    }
    
    @IBAction func signUpBtn(_ sender: Any) {
        viewModel.navigatePage(viewController: "SignUpViewController", navigationController: self.navigationController!)
    }
    

}
