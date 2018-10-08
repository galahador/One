//
//  MoonViewController.swift
//  One
//
//  Created by Petar Lemajic on 10/8/18.
//  Copyright © 2018 Petar Lemajic. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class MoonViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet weak var sceneMoonView: ARSCNView!

    override func viewDidLoad() {
        super.viewDidLoad()
        sceneMoonView.delegate = self
        moonSetup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        sceneMoonView.session.run(configuration)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneMoonView.session.pause()
    }

    fileprivate func moonSetup() {
        let sphere = SCNSphere(radius: 0.2)
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: "art.scnassets/moon.jpg")
        sphere.materials = [material]
        let node = SCNNode()
        node.position = SCNVector3(x: 0, y: 0.1, z: -0.5)
        node.geometry = sphere
        sceneMoonView.scene.rootNode.addChildNode(node)
    }
}
