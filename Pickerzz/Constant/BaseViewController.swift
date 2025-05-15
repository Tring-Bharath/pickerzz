//
//  UIView+Extensions.swift
//  Pickerzz
//
//  Created by Bharath on 15/05/25.
//

import Foundation
import UIKit


class BaseViewController: UIViewController {
    
    func setUpNavBarButton() {
        self.navigationItem.setHidesBackButton(true, animated: false)
        let backBtn:UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .done, target: self, action: #selector(backBtnAction))
        self.navigationItem.setLeftBarButton(backBtn, animated: true)
    }
    
    @objc func backBtnAction(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func showLoader() {
        
    }
    
    func hideLoader() {
        
    }
    
}
