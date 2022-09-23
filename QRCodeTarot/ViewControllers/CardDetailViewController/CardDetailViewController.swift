//
//  CardDetailViewController.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/4/22.
//

import UIKit
import TableMVVM
import CommonUIKitExtensions

class CardDetailViewController: UIViewController, HasPayload {
    
    @IBOutlet var cardImageView: CardImageView!
    @IBOutlet var collapsibleLabel: CollapsableLabelLabel!
    @IBOutlet var evolvedWithText: EvolvedWithText!

    var payload: Card! // unit tested.

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.title = ""
        title = payload.name.capitalized
        let lineCount = UILabel
            .with(width: UIScreen.main.bounds.width - 48)
            .with(lineCount: 0)
            .with(text: payload.desc)
            .actualLineCount
        
        cardImageView.viewModel = payload.image ?? .cardDemo
        collapsibleLabel.viewModel = .init(
            labelLabelViewModel: LabelLabel.ViewModel(
                topText: "Description",
                bottomText: payload.desc,
                lineCount: lineCount < 6 || payload.hasNoEvolutionContent ? 0 : 4
            ),
            buttonText: "Read More",
            buttonIsHidden: lineCount < 6 || payload.hasNoEvolutionContent
        )
        evolvedWithText.viewModel = payload.evolvedSwitchViewModel
        view.set(background: BackgroundView.zero.darkShade)
        collapsibleLabel.viewModel.buttonTapped =  { [weak collapsibleLabel] in
            collapsibleLabel?.viewModel.labelLabelViewModel.lineCount = 0
            collapsibleLabel?.viewModel.buttonIsHidden = true
        }
    }
}
