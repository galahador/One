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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupRoundedButtons()
        setupNavigationToBeTransparent()
    }

    fileprivate func setupNavigationToBeTransparent() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.tintColor = .red
    }

    fileprivate func setupRoundedButtons() {
        RoundedButton().buttonSetup(button: coreMLButton)
        RoundedButton().buttonSetup(button: augmentedReality)
    }
}
