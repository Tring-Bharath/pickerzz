import UIKit
import CoreData


//

class ImageTableViewCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    var objectId = NSManagedObjectID()
    var alert = AlertViewModel()
    var cellDelegate:CellDelegate?
    var cellViewModel:CollectionCellViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initGesture()
    }

    func loadData(imageItem:ImageModel){
        
        imageView.image = UIImage(data: imageItem.imageItem.image!)
        nameLabel.text = imageItem.imageItem.name
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
