//
//  StoredDataManager.swift
//  Pickerzz
//
//  Created by Bharath on 13/05/25.
//

import Foundation

class StoredDataManager{
    
    static let shared = StoredDataManager()
    
    var imageItems:[ImageEntity] = CoreDataManager.shared.fetchData()
}
