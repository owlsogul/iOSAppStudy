//
//  AddImageViewController.swift
//  ImagesTable
//
//  Created by CAUADC on 2017. 2. 6..
//  Copyright © 2017년 owlsogul. All rights reserved.
//

import UIKit

class AddImageViewController: UIViewController {
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var selectedImage: UIImageView!
    
    @IBAction func clickSaveButton(_ sender: UIButton){
        
    }
    
    //제스쳐 레코나이져
    @IBAction func tapImageView(_ sender: UITapGestureRecognizer){
        print("User tapp ed ImageView");
        //self.showImagePicker(type: UIImagePickerControllerSourceType.photoLibrary)
        
        let actionSheet: UIAlertController
        actionSheet = UIAlertController(title: "액션 선택", message:"액션을 선택해주세요", preferredStyle:UIAlertControllerStyleAlert)
        
        let cancelAction = UIAlertAction(title:"cancel", style:UIAlertActionStyle.cancel,
                                         handler:{(UIAlertAction) in
        print("cancel")
        })
        
        let libraryAction = UIAlertAction(title:"사진 가져오기", style:UIAlertActionStyle.default,
                                         handler:{
                                            (UIAlertAction) in
                                            print("cancel")
                                            self.showImagePicker(type: UIImagePickerControllerSourceType.photoLibrary)
        })
        let deleteAction = UIAlertAction(title:"OK", style:UIAlertActionStyle.cancel,
                                         handler:{(UIAlertAction) in
                                            print("cancel")
        })
        
        
    }
    
    func showImagePicker(type: UIImagePickerControllerSourceType){
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = type
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: {
            print("log")
        })
        
        
    }
    
    func imageOickerCotroller(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        
        print("user selected image");
        
        if let pickedImage: UIImage = info[UIImagePickerControllerEditedImage] as? UIImage{
            self.selectedImage.image = pickedImage
        }
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
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
