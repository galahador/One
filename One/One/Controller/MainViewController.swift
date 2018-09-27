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
        RoundedButton().buttonSetup(button: coreMLButton)
        RoundedButton().buttonSetup(button: augmentedReality)
        RoundedButton().buttonSetup(button: something)
    }
}
