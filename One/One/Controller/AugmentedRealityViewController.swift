//
//  AugmentedRealityViewController.swift
//  One
//
//  Created by Petar Lemajic on 11/15/18.
//  Copyright © 2018 Petar Lemajic. All rights reserved.
//

import UIKit

class AugmentedRealityViewController: UIViewController {

    @IBOutlet weak var ARSortTableView: UITableView!

    let augmentedRealityOptionDic = ["Earth": "art.scnassets/earth_daymap.jpg", "Earth at night": "art.scnassets/earth_nightmap.jpg", "Mars": "art.scnassets/mars.jpg", "Sun": "art.scnassets/sun.jpg", "Moon": "moon.jpg"]

    var augmentedRealityOptionArray = [CellObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAugmentedRealityOptionArray()
    }
    
    fileprivate func setupAugmentedRealityOptionArray() {
        for (key, value) in augmentedRealityOptionDic {
            augmentedRealityOptionArray.append(CellObject(cellLabel: key, assetName: value))
        }
    }

    @IBAction func buttonTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DiceViewController") as! DiceViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - UITableViewDelegate and UITableViewDataSource

extension AugmentedRealityViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let imageName = augmentedRealityOptionArray[indexPath.row].assetName
        let vc = storyboard?.instantiateViewController(withIdentifier: "ARViewController") as! AugmentedViewController
        vc.assetImageName = imageName
        navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension AugmentedRealityViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return augmentedRealityOptionArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "augmentedRealityCell") as! CustomAugmentedCell
        if augmentedRealityOptionArray.count > indexPath.row + 0 {
            cell.textLabel?.text = augmentedRealityOptionArray[indexPath.row].cellLabel
        }
        return cell
    }
}
