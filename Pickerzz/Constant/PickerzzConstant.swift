//
//  PickerzzConstant.swift
//  Pickerzz
//
//  Created by Bharath on 12/05/25.
//

import Foundation


class PickerzzConstant{
    
    

}


class StoredDataManager{
    
    static let shared = StoredDataManager()
    
    var imageItems:[ImageEntity] = CoreDataManager.shared.fetchData()
}
