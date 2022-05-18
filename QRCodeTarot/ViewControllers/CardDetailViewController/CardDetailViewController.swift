//
//  CardDetailViewController.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/4/22.
//

import UIKit
import TableMVVM

typealias CardDetailDataSource = TableDataSource4<
    SectionOneRow<ViewModelCell<CardImageView>>,
    SectionOneRow<ViewModelCell<CollapsableLabelLabel>>,
    SectionOneRow<ViewModelCell<TarotSwitchView>>,
    SectionAlternator2<
        SectionNoHeader<ViewModelCell<LabelLabel>>,
        SectionNoHeader<ViewModelCell<LabelLabel>>
    >
>

/// Needs to change to table View.  (Totally revamp.) with multiple sections. dark. 
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
