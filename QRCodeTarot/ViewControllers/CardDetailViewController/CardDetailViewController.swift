//
//  CardDetailViewController.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/4/22.
//

import UIKit
import TableMVVM
import CommonUIKitExtensions

typealias CardDetailDataSource = TableDataSource4<
    SectionOneRow<ViewModelCell<Container<UILabel>>>,
    SectionOneRow<ViewModelCell<Container<CardImageView>>>,
    SectionOneRow<ViewModelCell<Container<CollapsableLabelLabel>>>,
    SectionOneRow<ViewModelCell<Container<EvolvedWithText>>>
>

class CardDetailViewController: UIViewController {

    var dataSource: CardDetailDataSource = .init() {
        didSet {
            tableView.dataSource = dataSource
        }
    }

    lazy var tableView: UITableMVVM<CardDetailDataSource> = {
        UITableMVVM(viewModel: dataSource)
    }()

    var card: Card! // unit tested.

    static func instantiate(card: Card) -> CardDetailViewController {
        let detailController: CardDetailViewController = UIStoryboard.vc()!
        // Initializing or reading the view causes this rendering issue!!!!!
        // don't do this: detailController.view
        let lineCount = UILabel
            .with(width: UIScreen.main.bounds.width - 48)
            .with(lineCount: 0)
            .with(text: card.desc)
            .actualLineCount
        detailController.dataSource = CardDetailDataSource(
            section0: .init(
                cellViewModel: .init(
                    insets: .standard,
                    viewModel: .init(
                        text: card.name,
                        color: .white,
                        font: .inter(size: 30),
                        alignment: .center
                    )
                )
            ),
            section1: .init(cellViewModel: .init(insets: .standard, viewModel: card.image ?? .cardDemo)),
            section2: SectionOneRow(
                cellViewModel: .init(
                    insets: .standard,
                    viewModel: CollapsableLabelLabel.ViewModel(
                        labelLabelViewModel: LabelLabel.ViewModel(
                            topText: "Description",
                            bottomText: card.desc,
                            lineCount: lineCount < 6 ? 0 : 4
                        ),
                        buttonText: "Read More",
                        buttonIsHidden: lineCount < 6
                    )
                )
            ),
            section3: .init(cellViewModel: .init(insets: .standard, viewModel: card.evolvedSwitchViewModel))
        )
        detailController.card = card
        return detailController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .clear
        view.set(background: BackgroundView.zero.darkShade)
        view.inject(view: tableView)
        dataSource.section2.cellViewModel.viewModel.buttonTapped = { [weak self] in
            self?.dataSource.section2.cellViewModel.viewModel.labelLabelViewModel.lineCount = 0
            self?.dataSource.section2.cellViewModel.viewModel.buttonIsHidden = true
        }
    }
}
