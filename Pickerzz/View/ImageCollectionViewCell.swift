import UIKit
import CoreData


protocol CellDelegate{
    
    func presentAlert(alert:UIAlertController)
}


class ImageCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var image: UIImageView!
    
    var objectId = NSManagedObjectID()
    var imageDetail:ImageModel?
    var alert = AlertViewModel()
    var cellDelegate:CellDelegate?
    var cellViewModel:CollectionCellViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initGesture()
    }

    func loadData(imageItem:ImageModel){
        
        image.image = UIImage(data: imageItem.imageItem.image!)
        imageDetail?.imageItem = imageItem.imageItem
        objectId = imageItem.imageItem.objectID
        
    }
    
    @objc func longPress(){
        cellDelegate?.presentAlert(alert: alert.deleteImage(objectId: objectId))
//        self.transform = CGAffineTransformMakeScale(1.2, 1.2)
    }
    
    func initGesture(){
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPress))
        self.addGestureRecognizer(longPressGesture)
    }

}
