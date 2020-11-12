//
//  ReadingViewVC.swift
//  ReadingView
//
//  Created by Arif Rahman Sidik on 23/10/20.
//

import UIKit
import MobileCoreServices
import GPUImage

class ReadingViewVC: UIViewController, UIImagePickerControllerDelegate, UIDocumentPickerDelegate {
    
    @IBOutlet weak var buttonImportFile: UIButton!
    @IBOutlet weak var buttonScan: UIButton!
    
    var alertSheet = UIAlertController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = #imageLiteral(resourceName: "matematika")
        var imageData = image.jpegData(compressionQuality: 1)
        
        let imageBase64String = imageData?.base64EncodedString()
        print(imageBase64String ?? "Could not encode image to Base64")
        
        MathpixRequest.post(urlString: "https://api.mathpix.com/v3/text", image: imageBase64String!, completion: {_,_,_ in 
            
        })
    }
}
