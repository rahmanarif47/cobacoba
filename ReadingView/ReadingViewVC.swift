//
//  ReadingViewVC.swift
//  ReadingView
//
//  Created by Arif Rahman Sidik on 23/10/20.
//

import UIKit
import MobileCoreServices
import TesseractOCR
import GPUImage

class ReadingViewVC: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var buttonImportFile: UIButton!
    @IBOutlet weak var buttonScan: UIButton!
    
    var alertSheet = UIAlertController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        
        let imagePickerActionSheet =
          UIAlertController(title: "Snap/Upload Image",
                            message: nil,
                            preferredStyle: .actionSheet)
        
       let libraryButton = UIAlertAction(
        title: "Choose Existing",
        style: .default) { (alert) -> Void in
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.mediaTypes = [kUTTypeImage as String]
        self.present(imagePicker, animated: true, completion: {
            
        })
       }
        imagePickerActionSheet.addAction(libraryButton)
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
        imagePickerActionSheet.addAction(cancelButton)
        
        present(imagePickerActionSheet, animated: true)
    }
}
