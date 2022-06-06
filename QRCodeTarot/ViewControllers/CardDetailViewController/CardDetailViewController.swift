//
//  CardDetailViewController.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/4/22.
//

import UIKit
import TableMVVM

typealias CardDetailDataSource = TableDataSource5<
    SectionOneRow<ViewModelCell<UILabel>>,
    SectionOneRow<ViewModelCell<CardImageView>>,
    SectionOneRow<ViewModelCell<CollapsableLabelLabel>>,
    SectionOneRow<ViewModelCell<TarotSwitchView>>,
    SectionNoHeader<ViewModelCell<LabelLabel>>
>

class CardDetailViewController: UIViewController {

    var tableView: UITableMVVM<CardDetailDataSource> = UITableMVVM(viewModel: .init())
    var card: Card! // unit tested.

    static func instantiate(card: Card) -> CardDetailViewController {
        let detailController: CardDetailViewController = UIStoryboard.vc()!
        detailController.tableView.viewModel = CardDetailDataSource(
            section0: SectionOneRow(
                cellViewModel: .init(
                    text: card.name,
                    color: .white,
                    font: .inter(size: 30),
                    alignment: .center
                )
            ),
            section1: SectionOneRow(cellViewModel: card.image ?? .cardDemo),
            section2: SectionOneRow(
                cellViewModel: CollapsableLabelLabel.ViewModel(
                    topText: "Description",
                    bottomText: card.desc
                )
            ),
            section3: SectionOneRow(cellViewModel: TarotSwitchView.ViewModel()),
            section4: SectionNoHeader(cellsViewModels: card.evolvedViewModels)
        )
        detailController.card = card
        return detailController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .clear
        view.set(background: BackgroundView.zero.darkShade)
        view.inject(view: tableView)
        tableView.viewModel?.section2.cellViewModel.buttonTapped = { [weak self] in
            self?.tableView.viewModel?.section2.cellViewModel.labelLabelViewModel.lineCount = 0
            self?.tableView.viewModel?.section2.cellViewModel.buttonIsHidden = true
        }
        tableView.viewModel?.section3.cellViewModel.switchedToLeft = { [weak self] isEvolved in
            self?.tableView.updateViewModelWithoutTableUpdate { [weak self] in
                guard let self = self else { return }
                self.tableView.viewModel?.section3.cellViewModel.isLeft = isEvolved
                self.tableView.viewModel?.section4.cellsViewModels = isEvolved ? self.card.evolvedViewModels : self.card.unevolvedViewModels
            }
            guard let self = self else { return }
            self.tableView.reloadRows(at: self.tableView.indices(inSection: 3), with: .automatic)
        }
    }
}
