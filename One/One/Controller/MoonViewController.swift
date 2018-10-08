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


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        setupTouche(touches: touches, event: event)
    }

    fileprivate func setupTouche(touches: Set<UITouch>, event: UIEvent?) {
        if let touch = touches.first {
            let touchLocation = touch.location(in: sceneMoonView)
            let results = sceneMoonView.hitTest(touchLocation, types: .existingPlaneUsingExtent)

            if let hitResult = results.first {
                let diceScene = SCNScene(named: "art.scnassets/diceCollada.scn")!
                if let diceNode = diceScene.rootNode.childNode(withName: "Dice", recursively: true) {
                    diceNode.position = SCNVector3(
                        x: hitResult.worldTransform.columns.3.x,
                        y: hitResult.worldTransform.columns.3.y + diceNode.boundingSphere.radius,
                        z: hitResult.worldTransform.columns.3.z
                    )
                    sceneMoonView.scene.rootNode.addChildNode(diceNode)
                    let randomX = Float((arc4random_uniform(4) + 1)) * (Float.pi / 2)
                    let randomZ = Float((arc4random_uniform(4) + 1)) * (Float.pi / 2)
                    diceNode.runAction(SCNAction.rotateBy(x: CGFloat(randomX * 5), y: 0, z: CGFloat(randomZ * 5), duration: 0.5))
                }
            }
        }
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
