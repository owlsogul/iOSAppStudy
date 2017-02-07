//
//  AddImageViewController.swift
//  ImagesTable
//
//  Created by CAUADC on 2017. 2. 6..
//  Copyright © 2017년 owlsogul. All rights reserved.
//

import UIKit
import RealmSwift

class AddImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    // 이전화면에서 넘겨줄 photoInfo 정보
    // 넘겨주지 않을 수도 있기 떄문에 옵셔널
    var photoInfoFromPrevController: PhotoInfo?
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var selectedImage: UIImageView!
    
    func presentWarningAlert(title: String) -> (){
        let alert: UIAlertController
        alert = UIAlertController(title: "알림", message: title+"를 선택해주세요", preferredStyle: UIAlertControllerStyle.alert)
        let okAction: UIAlertAction
        okAction = UIAlertAction(title: "오키염", style: UIAlertActionStyle.default, handler: nil)
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func clickSaveButton(_ sender: UIButton){
        print("user pressed save button")
        
        
        // 렘 초기화 해서 realm 이름으로 사용
        let realm = try? Realm()
        // 사진 정보를 담을 객체 초기화하여 phtoInfo 이름으로 사용
        let photoInfo: PhotoInfo
        
        // 이전 화면에서 넘어온 정보가 있다면
        if let infoFromPrev = self.photoInfoFromPrevController {
            // photoInfo는 그정보를 받아서 쓸 것이고
            photoInfo = infoFromPrev
        }
        else{
            // 이전 화면에서 넘어온 정보가 없다면
            // photoInfo 에 새로운 PhotoInfo를 생성해 줍니다
            photoInfo = PhotoInfo()
        }
        
        
        if let image = self.selectedImage.image {
            print("사용자가 선택한 이미지가 있습니다")
            //사용자가  선택한 이미지를 JPEG dat 형식으로 변환하여 photoInfo에 저장
            photoInfo.imageData = UIImageJPEGRepresentation(image, 1.0)
        }
        else {
            presentWarningAlert(title: "이미지")
            //clickSaveButton 이라는 함수를 더이상 실행하지 않고 여기서 끝내겠습니다. return
            return
        }
        
        if let title = self.titleField.text , title.characters.count > 0 {
            print("사용자가 작성한 제목이 있습니다")
            // 사용자가 작성한 제목을 photoInfo에 저장
            photoInfo.title = title
        }
        else {
            presentWarningAlert(title: "제목")
            return
        }
        
        try? realm?.write {
            realm?.add(photoInfo)
            self.navigationController?.popViewController(animated: true)
        }
        
        
        
        
    }
    
    //제스쳐 레코나이져
    @IBAction func tapImageView(_ sender: UITapGestureRecognizer){
        print("User tapp ed ImageView");
        //self.showImagePicker(type: UIImagePickerControllerSourceType.photoLibrary)
        
        let actionSheet: UIAlertController
        actionSheet = UIAlertController(title: "액션 선택", message:"액션을 선택해주세요", preferredStyle:UIAlertControllerStyle.actionSheet)
        
        let cancelAction = UIAlertAction(title:"취소", style:UIAlertActionStyle.cancel, handler:{
            (UIAlertAction) in
                print("cancel")
        })
        
        let libraryAction = UIAlertAction(title:"사진 고르기", style:UIAlertActionStyle.default, handler:{
            (UIAlertAction) in
            print("add")
            self.showImagePicker(type: UIImagePickerControllerSourceType.photoLibrary)
        })
        
        let deleteAction = UIAlertAction(title:"사진 삭제", style:UIAlertActionStyle.destructive, handler:{
            (UIAlertAction) in
            print("delete")
            self.selectedImage.image = nil
        })
        
        actionSheet.addAction(cancelAction)
        actionSheet.addAction(libraryAction)
        actionSheet.addAction(deleteAction)
        
        self.present(actionSheet, animated: true, completion: nil)
        
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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        
        print("user selected image");
        
        if let pickedImage: UIImage = info[UIImagePickerControllerEditedImage] as? UIImage{
            self.selectedImage.image = pickedImage
        }
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    //
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 이전 화면에서 넘어온 정보가 있을지 없을지 모르기 때문에 옵셔널을 추출해봅니다
        if let info = photoInfoFromPrevController{
            
            // 사진정보의 title을 제목 필드에 세팅
            self.titleField.text = info.title
            
            // 사진정보의 이미지 데이터를 UIImage로 변경해서 selectedImage 이미지뷰에 세팅
            if let imageData = info.imageData{
                self.selectedImage.image = UIImage(data: imageData, scale: 1.0)
            }

        }

        
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
