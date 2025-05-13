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
    var cellViewModel:CollectionCellViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initGesture()
    }

    func loadData(imageItem:ImageModel){
        
        image.image = UIImage(data: imageItem.imageItem.image!)
        name.text = imageItem.imageItem.name
        objectId = imageItem.imageItem.objectID
        
    }
    
    @objc func longPress(){
        cellDelegate?.presentAlert(alert: alert.deleteImage(objectId: objectId))
    }
    
    func initGesture(){
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPress))
        self.addGestureRecognizer(longPressGesture)
    }

}
