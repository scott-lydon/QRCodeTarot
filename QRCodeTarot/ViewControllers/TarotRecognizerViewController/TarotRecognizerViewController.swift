//
//  TarotRecognizerViewController.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 6/9/22.
//

import UIKit
import SceneKit
import ARKit

class TarotRecognizerViewController: UIViewController, ARSCNViewDelegate {

    var sceneView = ARSCNView.zero
    var dispatcher: CanAsync = DispatchQueue.main

    override func viewDidLoad() {
        super.viewDidLoad()
        view.inject(view: sceneView)
        view.set(background: BackgroundView.zero.darkShade)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        guard let arImages: Set<ARReferenceImage> = ARReferenceImage
            .referenceImages(inGroupNamed: "AR Resources", bundle: nil) else { return }
        configuration.detectionImages = arImages
        configuration.planeDetection = .horizontal
        sceneView.debugOptions = [.showFeaturePoints] // happens to look really cool, with yellow dots
        sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
        sceneView.delegate = self
    }

    /// called when we detected an image.
    func renderer(
        _ renderer: SCNSceneRenderer,
        didAdd node: SCNNode,
        for anchor: ARAnchor
    ) {
        guard let imageAnchor = anchor as? ARImageAnchor,
              let imageName = imageAnchor.referenceImage.name,
              let card: Card = Card(imageName: imageName) else { return }
        dispatcher.async(group: nil, qos: .unspecified, flags: []) { [weak self] in
            self?.dismiss(animated: true)
            self?.navigationController?.pushViewController(
                UIHostingController(rootView: CardDetailView(card: card)),
                animated: true
            )
        }
    }
}
