//
//  NewPlaceViewController.swift
//  MyPlaces
//
//  Created by Pavel on 28.10.2023.
//

import UIKit

class NewPlaceViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
        //MARK: table view delegate
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if indexPath.row == 0 {
                let actionSheet = UIAlertController(title: nil,
                                                    message: nil,
                                                    preferredStyle: .actionSheet)
                let camera = UIAlertAction(title: "Camera", style: .default) { _ in
                    self.chooseImagePicker(source: .camera)
                }
                let photo = UIAlertAction(title: "Photo", style: .default) { _ in
                    self.chooseImagePicker(source: .photoLibrary)
                }
                let cancel = UIAlertAction(title: "Cancel", style: .cancel){ _ in
                    
                }
                
                actionSheet.addAction(camera)
                actionSheet.addAction(photo)
                actionSheet.addAction(cancel)
                present(actionSheet, animated: true)
            } else {
                view.endEditing(true)
            }
        }
    }

//MARK: text field delegate

extension NewPlaceViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
//MARK: work with image

extension NewPlaceViewController {
    func chooseImagePicker(source:UIImagePickerController.SourceType){
        if UIImagePickerController.isSourceTypeAvailable(source){
            let imagePicker = UIImagePickerController()
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }
}
