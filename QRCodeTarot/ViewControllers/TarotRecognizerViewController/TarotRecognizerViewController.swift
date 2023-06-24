//
//  TarotRecognizerViewController.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 6/9/22.
//

import ARKit
import SceneKit
import SwiftUI
import UIKit

class TarotRecognizerViewController: UIViewController, ARSCNViewDelegate {
    var sceneView = ARSCNView.zero
    var dispatcher: CanAsync = DispatchQueue.main
    var pendingNavigation = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view.inject(view: sceneView)
        view.set(background: BackgroundView.zero.darkShade)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // When not in view did load, a bug appears after a view cycles, where nothing is recognized. 
        let configuration = ARWorldTrackingConfiguration()
        guard let arImages: Set<ARReferenceImage> = ARReferenceImage
            .referenceImages(inGroupNamed: "AR Resources", bundle: nil) else { return }
        configuration.detectionImages = arImages
        configuration.planeDetection = .horizontal
        sceneView.debugOptions = [.showFeaturePoints] // happens to look really cool, with yellow dots
        sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
        sceneView.delegate = self
        pendingNavigation = false
    }

    /// called when we detected an image.
    func renderer(
        _ renderer: SCNSceneRenderer,
        didAdd node: SCNNode,
        for anchor: ARAnchor
    ) {
        guard let imageAnchor = anchor as? ARImageAnchor,
              let imageName = imageAnchor.referenceImage.name,
              let card = Card(imageName: imageName),
              // Prevents double navigation when multiple cards are detected at the same time.
              // Also prevents the transition to the wrong card after multiple.
              !pendingNavigation else { return }
        pendingNavigation = true
        CardPickEvent(card: card).save()
        dispatcher.async { [weak self] in
            self?.navigationController?.pushViewController(
                UIHostingController(rootView: CardDetailView(card: card)),
                animated: true
            )
        }
    }
}
