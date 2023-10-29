//
//  NewPlaceViewController.swift
//  MyPlaces
//
//  Created by Pavel on 28.10.2023.
//

import UIKit

class NewPlaceViewController: UITableViewController, UINavigationControllerDelegate {
    
    var newPlace: Place?
    var imageIsChanged = false
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var placeName: UITextField!
    @IBOutlet weak var placeType: UITextField!
    @IBOutlet weak var placeLocation: UITextField!
    
    override func viewDidLoad() {
        saveButton.isEnabled = false
        placeName.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        super.viewDidLoad()
    }
        //MARK: table view delegate
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if indexPath.row == 0 {
                let cameraIcon = UIImage(named: "camera")
                let photoIcon = UIImage(named: "photo1")
                
                let actionSheet = UIAlertController(title: nil,
                                                    message: nil,
                                                    preferredStyle: .actionSheet)
                let camera = UIAlertAction(title: "Camera", style: .default) { _ in
                    self.chooseImagePicker(source: .camera)
                }
                camera.setValue(cameraIcon, forKey: "image")
                camera.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
                
                let photo = UIAlertAction(title: "Photo", style: .default) { _ in
                    self.chooseImagePicker(source: .photoLibrary)
                }
                photo.setValue(photoIcon, forKey: "image")
                photo.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
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
    
    func saveNewPLace(){
        var image: UIImage?
        if imageIsChanged {
            image = placeImage.image
        }
        else{
            image = UIImage(named: "imagePlaceholder")
        }
        
        newPlace = Place(name: placeName.text!,
                         location: placeLocation.text,
                         type: placeType.text,
                         image: image,
                         restaurantImage: "")
        
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true)
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

extension NewPlaceViewController: UIImagePickerControllerDelegate {
    func chooseImagePicker(source:UIImagePickerController.SourceType){
        if UIImagePickerController.isSourceTypeAvailable(source){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }
    @objc private func textFieldChanged(){
        if placeName.text?.isEmpty == false {
            saveButton.isEnabled = true
            }
        else {
            saveButton.isEnabled = false
            }
        }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        placeImage.image = info[.editedImage] as? UIImage
        placeImage.contentMode = .scaleAspectFit
        placeImage.clipsToBounds = true
        dismiss(animated: true, completion: nil)
        imageIsChanged = true
    }
    
}
