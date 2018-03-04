//
//  UploadViewController.swift
//  Instagram
//
//  Created by Jasmine Edwards on 2/28/18.
//  Copyright © 2018 Jasmine Edwards. All rights reserved.
//

import UIKit
import Parse


class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var caption: UITextField!
    
    
    //take a picture from either cam or photo lib 
    @IBAction func onTap(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("Camera is available 📸")
            vc.sourceType = .camera
        } else {
            print("Camera 🚫 available so we will use photo library instead")
            vc.sourceType = .photoLibrary
        }
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
    
    
    @IBAction func shareImage(_ sender: Any) {
        Post.postUserImage(image: imageView.image, withCaption: caption.text) { (status: Bool, error: Error?) in
            self.imageView.image = nil
            self.caption.text = nil
        }
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any])
    {
        // Get the image captured by the UIImagePickerController
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
        
        imageView.image = originalImage
        
        // Dismiss UIImagePickerController to go back to your original view controller
        dismiss(animated: true, completion: nil)
    }
    
    
    
    //perform segueue to tke you to where you make a caption and upload the pics
    
    //name suegue
    //or tap gesture
    
    
    //post to ig link--covert to Parse create a new file-(ex post class) copy the code exactly and paste it into a bare swift file. hed with import parse --some changed that MAY need to be made- ex:with  post." "  do post["media"] remove first variables at top --to call this function go back to the view controller that we are posting to , share/upload button needs to be an action(name it on share image)--
    
    //view last 20 postscall- call func refresh in view did load in main controller
    
    //class name in post file should be same name in query when you try to post 20 images
    
    //
    
    //resizes image to be 10MB for Parse
    func resize(image: UIImage, newSize: CGSize) -> UIImage {
        let resizeImageView = UIImageView(frame:CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        resizeImageView.contentMode = UIViewContentMode.scaleAspectFill
        resizeImageView.image = image
        
        UIGraphicsBeginImageContext(resizeImageView.frame.size)
        resizeImageView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
