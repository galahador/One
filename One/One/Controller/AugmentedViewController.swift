//
//  TEST.swift
//  One
//
//  Created by Petar Lemajic on 11/16/18.
//  Copyright © 2018 Petar Lemajic. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class AugmentedViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet weak var sceneView: ARSCNView!

    var assetImageName: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegate = self
        imageSetup(imageName: assetImageName)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        sceneView.session.run(configuration)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }

    fileprivate func imageSetup(imageName: String) {
        let sphere = SCNSphere(radius: 0.2)
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: imageName)
        sphere.materials = [material]
        let node = SCNNode()
        node.position = SCNVector3(x: 0, y: 0.1, z: -0.5)
        node.geometry = sphere
        sceneView.scene.rootNode.addChildNode(node)
    }
}




