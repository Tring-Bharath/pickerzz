//
//  ViewController.swift
//  Pickerzz
//
//  Created by Bharath on 12/05/25.
//

import UIKit

class ViewController: BaseViewController, CellDelegate {

    @IBOutlet weak var toggleViewBtn: UIButton!
    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    @IBOutlet weak var sideBarLeadingConstraint: NSLayoutConstraint!
    let imagePicker = ImagePickerViewModel()
    let addAlert = AlertViewModel()
    var isCollectionView:Bool = true
    var isSideBarVisible = false
    override func viewDidLoad() {
        super.viewDidLoad()
        initSetUp()
    }

    @IBAction func addImageBtn(_ sender: Any) {
        imagePicker.imagePicker.delegate = self
        imagePicker.presentImagePicker(view:self,animated:true)
    }
    @IBAction func sideBarToggleBtn(_ sender: Any) {
        
        isSideBarVisible ? sideBarToggle(constant: -120) : sideBarToggle(constant: 0)
        isSideBarVisible.toggle()
    }
    
    @IBAction func logOutBtn(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func toggleViewBtn(_ sender: Any) {
        
        if(isCollectionView){
            toggleViewBtn.setTitle("Collection View", for: .normal)
            imageCollectionView.register(UINib(nibName: "ImageTableViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageTableViewCell")
        }
        else{
            toggleViewBtn.setTitle("Table View", for: .normal)
            imageCollectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
        }
        
        isCollectionView.toggle()
        
        UIView.transition(with: imageCollectionView, duration: 1.0, options: .transitionCrossDissolve, animations: {self.imageCollectionView.reloadData()}, completion: nil)

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        sideBarToggle(constant: -120)
    }
    func initSetUp(){
        
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
        imageCollectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
         
        imageCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        CoreDataManager.shared.onDataUpdate = { [weak self] in
            DispatchQueue.main.async {
                guard let strongSelf = self else { return }
                UIView.transition(with: strongSelf.imageCollectionView, duration: 1.0, options: .transitionCrossDissolve, animations: {strongSelf.imageCollectionView.reloadData()}, completion: nil)

            }
        }
        toggleViewBtn.setTitle("Table View", for: .normal)
    }
    func sideBarToggle(constant:CGFloat){
        UIView.animate(withDuration: 0.5, animations: {
            self.sideBarLeadingConstraint.constant = constant
            self.view.layoutIfNeeded()
            
        })
    }
}

extension ViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CoreDataManager.shared.fetchData().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let imageItem = StoredDataManager.shared.imageItems[indexPath.row]
        let imageModel = ImageModel(imageItem: imageItem)
        
        if(!isCollectionView ){
            
            let cell = imageCollectionView.dequeueReusableCell(withReuseIdentifier: "ImageTableViewCell", for: indexPath) as! ImageTableViewCell
            cell.cellDelegate = self
            cell.loadData(imageItem:imageModel)
            return cell
            
        }
        else{
            
            let cell = imageCollectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
            cell.cellDelegate = self
            cell.loadData(imageItem:imageModel)
            return cell
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let imageDetailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ImageDetailViewController") as! ImageDetailViewController
        let imageItem = CoreDataManager.shared.fetchData()[indexPath.row]
        imageDetailVC.imageItem = imageItem
        imageDetailVC.navigationItem.setHidesBackButton(true, animated: true)
        
        self.navigationController?.pushViewController(imageDetailVC, animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var cellWidth:CGFloat
        var cellHeight:CGFloat
        
        if(isCollectionView){

            cellWidth = collectionView.frame.size.width/3 - 10
            cellHeight = cellWidth
        }
        else{
            
            cellWidth = collectionView.frame.size.width
            cellHeight = 100
        }

        return CGSize(width: cellWidth , height: cellHeight)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        10
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
    
    
}

