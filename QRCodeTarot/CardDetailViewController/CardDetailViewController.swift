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
        let detailController = UIStoryboard(name: "CardDetailViewController", bundle: .main)
            .instantiateViewController(withIdentifier:  "CardDetailViewController") as! CardDetailViewController
        detailController.loadView()
        // unit tested
        detailController.titleLabel.text = title
        detailController.detailsLabel.text = details
        return detailController
    }
}
