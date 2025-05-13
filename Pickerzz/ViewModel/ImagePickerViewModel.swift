//
//  ImagePickerViewModel.swift
//  Pickerzz
//
//  Created by Bharath on 12/05/25.
//
import UIKit
import Foundation

class ImagePickerViewModel{
    
    var imagePicker = UIImagePickerController()
    
    func presentImagePicker(view:ViewController,animated:Bool){
        imagePicker.sourceType = .photoLibrary
        view.present(imagePicker, animated: true)
    }
    
}
