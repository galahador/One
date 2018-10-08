//
//  AugmentedRealityViewController.swift
//  One
//
//  Created by Petar Lemajic on 10/8/18.
//  Copyright © 2018 Petar Lemajic. All rights reserved.
//

import UIKit

class AugmentedRealityViewController : UIViewController {
    @IBOutlet weak var diceButton: UIButton!
    @IBOutlet weak var moonButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRoundedButtons()
    }
    
    fileprivate func setupRoundedButtons() {
        RoundedButton().buttonSetup(button: diceButton)
        RoundedButton().buttonSetup(button: moonButton)
    }    
}
