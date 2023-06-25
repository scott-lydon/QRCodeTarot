//
//  TarotRecognizerViewController.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 6/9/22.
//

import ARKit
import SceneKit
import SwiftKeychainWrapper
import SwiftUI
import UIKit

class TarotRecognizerViewController: UIViewController, ARSCNViewDelegate {

    private let hasDeckKey = #function

    var sceneView = ARSCNView.zero
    var dispatcher: CanAsync = DispatchQueue.main
    var pendingNavigation = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view.inject(view: sceneView)
        view.set(background: BackgroundView.zero.darkShade)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard KeychainWrapper.standard.integer(forKey: hasDeckKey) != 1 else { return }
        // Show the alert
        let alertController = UIAlertController(
            title: "Scan 🔍 a card",
            message: "This app can scan and read Pointy Hat Tarot cards 🃏.",
            preferredStyle: .alert
        )
        let actions: [UIAlertAction] = [
            UIAlertAction(title: "Buy Deck 🛒", style: .default) { _ in
                if let url = URL(string: "https://www.etsy.com/listing/1510035687/pointy-hat-tarot-and-playing-card-deck") {
                    UIApplication.shared.open(url)
                }
            },
            UIAlertAction(title: "I have the deck ✅", style: .default) { _ in
                KeychainWrapper.standard.set(1, forKey: self.hasDeckKey)
            },
            UIAlertAction(title: "No Thanks 🙅‍♂️", style: .cancel)
        ]
        actions.forEach { alertController.addAction($0) }
        present(alertController, animated: true)
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
