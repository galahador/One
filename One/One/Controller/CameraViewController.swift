//
//  CameraViewController.swift
//  One
//
//  Created by Petar Lemajic on 9/27/18.
//  Copyright © 2018 Petar Lemajic. All rights reserved.
//

import UIKit
import CoreML
import Vision


class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let imagePicker = UIImagePickerController()
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePickerSetup()
    }

    fileprivate func imagePickerSetup() {
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = false
    }

    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let userPickedimage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = userPickedimage
            guard let ciimage = CIImage(image: userPickedimage) else {
                fatalError("Could not convert image to ciimage")
            }
            detect(image: ciimage)
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }

    fileprivate func detect(image: CIImage) {
        guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else {
            fatalError("Loadin CRModel failed")
        }

        let request = VNCoreMLRequest(model: model) { (secondRequest, error) in
            guard let result = secondRequest.results as? [VNClassificationObservation] else {
                fatalError("model failed to proces image")
            }
            print(result)
            if let firstResult = result.first {
                if firstResult.identifier.contains("keyboard") {
                    self.navigationItem.title = "keyboard"
                } else if firstResult.identifier.contains("pen") {
                    self.navigationItem.title = "pen"
                } else if firstResult.identifier.contains("watch") {
                    self.navigationItem.title = "watch"
                } else if firstResult.identifier.contains("laptop") {
                    self.navigationItem.title = "laptop"
                } else if firstResult.identifier.contains("keys") {
                    self.navigationItem.title = "keys"
                } else if firstResult.identifier.contains("vase") {
                    self.navigationItem.title = "vase"
                } else if firstResult.identifier.contains("chair") {
                    self.navigationItem.title = "chair"
                } else if firstResult.identifier.contains("window shade") {
                    self.navigationItem.title = "window shade"
                } else if firstResult.identifier.contains("window") {
                    self.navigationItem.title = "window"
                } else if firstResult.identifier.contains("phone") {
                    self.navigationItem.title = "phone"
                } else if firstResult.identifier.contains("tree") {
                    self.navigationItem.title = "tree"
                } else if firstResult.identifier.contains("car") {
                    self.navigationItem.title = "car"
                } else if firstResult.identifier.contains("head") {
                    self.navigationItem.title = "head"
                } else if firstResult.identifier.contains("knife") {
                    self.navigationItem.title = "knife"
                } else if firstResult.identifier.contains("running shoe") {
                    self.navigationItem.title = "running shoe"
                } else if firstResult.identifier.contains("dog") {
                    self.navigationItem.title = "dog"
                } else if firstResult.identifier.contains("apple") {
                    self.navigationItem.title = "apple"
                } else if firstResult.identifier.contains("ananas") {
                    self.navigationItem.title = "ananas"
                } else if firstResult.identifier.contains("hotdog") {
                    self.navigationItem.title = "hotdog"
                } else if firstResult.identifier.contains("cat") {
                    self.navigationItem.title = "cat"
                } else if firstResult.identifier.contains("American black bear") {
                    self.navigationItem.title = "American black bear"
                } else if firstResult.identifier.contains("shovel") {
                    self.navigationItem.title = "shovel"
                } else if firstResult.identifier.contains("German shepherd dog") {
                    self.navigationItem.title = "German shepherd dog"
                } else {
                    self.navigationItem.title = "Ooops i am confused -.-"
                }
            }
        }

        let handler = VNImageRequestHandler(ciImage: image)
        do {
            try handler.perform([request])
        } catch {
            print("handler failed to handle request \(error)")
        }
    }

    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        present(imagePicker, animated: true, completion: nil)
    }
}
