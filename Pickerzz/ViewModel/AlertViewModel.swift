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
        
        let addAlert = UIAlertController(title: Constant.Alert.Add.title, message: Constant.Alert.Add.desc, preferredStyle: .alert)
        addAlert.addTextField()
        
        let cancelBtn = UIAlertAction(title: Constant.Alert.cancel, style: .default)
        let addBtn = UIAlertAction(title: Constant.Alert.add, style: .default){ _ in
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
        
        let deleteAlert = UIAlertController(title: Constant.Alert.Delete.title, message: Constant.Alert.Delete.desc, preferredStyle: .alert)
        
        let cancelBtn = UIAlertAction(title: Constant.Alert.cancel, style: .cancel)
        let deleteBtn = UIAlertAction(title: Constant.Alert.delete, style: .default){ _ in
            
            CoreDataManager.shared.deleteObject(objectID: objectId)
            
        }
        deleteAlert.addAction(deleteBtn)
        deleteAlert.addAction(cancelBtn)
        
        return deleteAlert
    }
}
