//
//  MainViewController.swift
//  One
//
//  Created by Petar Lemajic on 9/27/18.
//  Copyright © 2018 Petar Lemajic. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var coreMLButton: UIButton!
    @IBOutlet weak var augmentedReality: UIButton!
    @IBOutlet weak var something: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonSetup(button: coreMLButton)
        buttonSetup(button: augmentedReality)
        buttonSetup(button: something)


    }
    
    fileprivate func buttonSetup(button: UIButton) {
        button.layer.cornerRadius = 14
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.clear.cgColor
    }
}
