import UIKit
import CoreData


protocol CellDelegate{
    
    func presentAlert(alert:UIAlertController)
}

class ImageCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    var objectId = NSManagedObjectID()
    var alert = AlertViewModel()
    var cellDelegate:CellDelegate?
    
    var data = PickerzzConstant()
    override func awakeFromNib() {
        super.awakeFromNib()
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPress))
        self.addGestureRecognizer(longPressGesture)
    }


    func loadData(index:Int){
        
        guard let currImage = StoredDataManager.shared.imageItems[index].image else{
            return
        }
        
        image.image = UIImage(data: currImage)
        name.text = StoredDataManager.shared.imageItems[index].name
        objectId = StoredDataManager.shared.imageItems[index].objectID
    }
    
    @objc func longPress(){
        
        cellDelegate?.presentAlert(alert: alert.deleteImage(objectId: objectId))
        
    }

}
