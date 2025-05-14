//
//  FirstPageViewController.swift
//  Pickerzz
//
//  Created by Bharath on 14/05/25.
//

import UIKit

class FirstPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginPageViewController")
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
    @IBAction func signUpBtn(_ sender: Any) {
        let signUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpViewController")
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
    

}
