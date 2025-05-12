//
//  ImageModel.swift
//  Pickerzz
//
//  Created by Bharath on 12/05/25.
//

import Foundation
import UIKit

class ImageModel{
    
    var name:String?
    var image:UIImage?
    
    init(name: String? = nil, image: UIImage? = nil) {
        self.name = name
        self.image = image
    }
}
