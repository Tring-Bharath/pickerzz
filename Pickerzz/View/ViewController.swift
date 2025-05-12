//
//  ViewController.swift
//  Pickerzz
//
//  Created by Bharath on 12/05/25.
//

import UIKit

class ViewController: UIViewController, CellDelegate {

    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    let imagePicker = ImagePickerViewModel()
    let addAlert = AlertViewModel()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        initSetUp()
    }

    @IBAction func addImageBtn(_ sender: Any) {
        imagePicker.imagePicker.delegate = self
        imagePicker.presentImagePicker(view:self,animated:true)
    }
    
    func initSetUp(){
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
        imageCollectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
        imageCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        CoreDataManager.shared.onDataUpdate = { [weak self] in
                DispatchQueue.main.async {
                    self?.imageCollectionView.reloadData()
                }
            }
    }
    
}

extension ViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CoreDataManager.shared.fetchData().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = imageCollectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        cell.cellDelegate = self
        cell.loadData(index: indexPath.row)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.bounds.width/3 - 10, height: 100)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        dismiss(animated: true)
        
        if let pickedImage = info[.originalImage] as? UIImage{
            present(addAlert.addImageName(image: pickedImage), animated: true)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
    
    func presentAlert(alert: UIAlertController) {
        present(alert,animated: true)

    }
    
    func passVC()-> UIViewController{
        return self
    }
    
}

