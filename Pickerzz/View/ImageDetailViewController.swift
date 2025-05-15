//
//  ImageDetailViewController.swift
//  Pickerzz
//
//  Created by Bharath on 15/05/25.
//

import UIKit

class ImageDetailViewController: UIViewController {

    @IBOutlet weak var imageNameLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageDateLabel: UILabel!
    
    var imageItem:ImageEntity?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI(){
        let backBtn:UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .done, target: self, action: #selector(backBtnAction))
        self.navigationItem.setLeftBarButton(backBtn, animated: true)
        imageNameLabel.text = imageItem?.name
        imageView.image = UIImage(data: (imageItem?.image!)!)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        imageDateLabel.text = dateFormatter.string(from: (imageItem?.date!)!) 
    }

    @objc func backBtnAction(){
        self.navigationController?.popViewController(animated: true)
    }
}
