//
//  CoreDataManager.swift
//  Pickerzz
//
//  Created by Bharath on 12/05/25.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager{
    
    static let shared = CoreDataManager()
    var onDataUpdate: (() -> Void)?
    let persistentContainer : NSPersistentContainer
    let constant = PickerzzConstant()
    
    private init(){
        persistentContainer = NSPersistentContainer(name: "ImageDataModel")
        persistentContainer.loadPersistentStores{ (description,error) in
            if let error=error{
                fatalError("Fatal Error \(error)")
            }
        }
    }
    
    var context : NSManagedObjectContext{
        return persistentContainer.viewContext
    }
    
    func insertImage(image:UIImage,name:String){
        
        let imageEntity = NSEntityDescription.entity(forEntityName: "ImageEntity", in: context)!
        let imageObject = NSManagedObject(entity: imageEntity, insertInto: context)
        imageObject.setValue(image.pngData(), forKey: "image")
        imageObject.setValue(name, forKey: "name")
        saveData()
        
    }
    
    func fetchData()->[ImageEntity]{
        let fetchRequest:NSFetchRequest<ImageEntity> = ImageEntity.fetchRequest()
        do{
            let result = try context.fetch(fetchRequest)
            return result
            
        }
        catch{
            print(error.localizedDescription)
        }
        return []
    }
    
    func deleteObject(objectID: NSManagedObjectID) {
        do {
            let objectToDelete = try context.existingObject(with: objectID)
            context.delete(objectToDelete)
        } catch {
            print(error.localizedDescription)
        }
        
        saveData()
    }
    
    func saveData(){
        do{
            try context.save()
        }catch{
            print(error.localizedDescription)
        }
        StoredDataManager.shared.imageItems = fetchData()
        onDataUpdate?()
    }
    
}
