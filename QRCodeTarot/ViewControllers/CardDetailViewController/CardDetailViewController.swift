//
//  CardDetailViewController.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/4/22.
//

import UIKit
import TableMVVM
import CommonUIKitExtensions

class CardDetailViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var cardImageView: CardImageView!
    @IBOutlet var collapsibleLabel: CollapsableLabelLabel!
    @IBOutlet var evolvedWithText: EvolvedWithText!

    var card: Card! // unit tested.

    static func instantiate(card: Card) -> CardDetailViewController {
        let detailController: CardDetailViewController = UIStoryboard.vc()!
        // Initializing or reading the view causes this rendering issue!!!!!
        // don't do this: detailController.view
        detailController.card = card
        return detailController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.title = ""
        title = card.name.capitalized
        let lineCount = UILabel
            .with(width: UIScreen.main.bounds.width - 48)
            .with(lineCount: 0)
            .with(text: card.desc)
            .actualLineCount
        
        cardImageView.viewModel = card.image ?? .cardDemo
        collapsibleLabel.viewModel = .init(
            labelLabelViewModel: LabelLabel.ViewModel(
                topText: "Description",
                bottomText: card.desc,
                lineCount: lineCount < 6 || card.hasNoEvolutionContent ? 0 : 4
            ),
            buttonText: "Read More",
            buttonIsHidden: lineCount < 6 || card.hasNoEvolutionContent
        )
        evolvedWithText.viewModel = card.evolvedSwitchViewModel
        view.set(background: BackgroundView.zero.darkShade)
        collapsibleLabel.viewModel.buttonTapped =  { [weak collapsibleLabel] in
            collapsibleLabel?.viewModel.labelLabelViewModel.lineCount = 0
            collapsibleLabel?.viewModel.buttonIsHidden = true
        }
    }
}
