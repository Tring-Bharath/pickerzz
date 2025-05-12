//
//  AlertViewModel.swift
//  Pickerzz
//
//  Created by Bharath on 12/05/25.
//

import Foundation
import UIKit
import CoreData

class AlertViewModel{
    
    
    func addImageName(image:UIImage)->UIAlertController{
        
        let addAlert = UIAlertController(title: "Insert Name", message: "Add name to your image", preferredStyle: .alert)
        addAlert.addTextField()
        
        let cancelBtn = UIAlertAction(title: "Cancel", style: .default)
        let addBtn = UIAlertAction(title: "Add", style: .default){ _ in
            guard let imageName = addAlert.textFields?.first?.text else{
                return
            }
            CoreDataManager.shared.insertImage(image: image, name: imageName)
        }
        addAlert.addAction(cancelBtn)
        addAlert.addAction(addBtn)
        
        return addAlert
        
    }
    
    func deleteImage(objectId:NSManagedObjectID) -> UIAlertController{
        
        let deleteAlert = UIAlertController(title: "Delete", message: "Delete Image", preferredStyle: .alert)
        
        let cancelBtn = UIAlertAction(title: "Cancel", style: .cancel)
        let deleteBtn = UIAlertAction(title: "Delete", style: .default){ _ in
            
            CoreDataManager.shared.deleteObject(objectID: objectId)
            
        }
        deleteAlert.addAction(deleteBtn)
        deleteAlert.addAction(cancelBtn)
        
        return deleteAlert
    }
}
