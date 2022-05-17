//
//  CardDetailViewController.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/4/22.
//

import UIKit

class CardDetailViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var detailsLabel: UILabel!

    static func instantiat(card: Card) -> CardDetailViewController {
        instantiate(title: card.name, details: card.desc)
    }

    static func instantiate(title: String, details: String) -> CardDetailViewController {
        let detailController: CardDetailViewController = UIStoryboard.vc()! //unitested
        detailController.loadView()
        detailController.view.set(background: BackgroundView.zero.darkShade)
        detailController.titleLabel.text = title
        detailController.detailsLabel.text = details
        return detailController
    }
}
