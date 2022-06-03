//
//  CardDetailViewController.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/4/22.
//

import UIKit
import TableMVVM

typealias CardImageCell = ViewModelCell<CardImageView>
typealias CollapseTextCell = ViewModelCell<CollapsableLabelLabel>
typealias TarotSwitchCell = ViewModelCell<TarotSwitchView>

typealias CardDetailDataSource = TableDataSource5<
    SectionOneRow<ViewModelCell<UILabel>>,
    SectionOneRow<CardImageCell>,
    SectionOneRow<CollapseTextCell>,
    SectionOneRow<TarotSwitchCell>,
    SectionNoHeader<ViewModelCell<LabelLabel>>
>

/// Needs to change to table View.  (Totally revamp.) with multiple sections. dark. 
class CardDetailViewController: UIViewController {

    var dataSource: CardDetailDataSource = .init() {
        didSet {
            tableView.viewModel = dataSource
        }
    }

    lazy var tableView: UITableMVVM<CardDetailDataSource> = {
        UITableMVVM(viewModel: dataSource)
    }()

    var card: Card! // unit tested.

    static func instantiate(card: Card) -> CardDetailViewController {
        let detailController: CardDetailViewController = UIStoryboard.vc()!
        detailController.dataSource = .init(
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
        dataSource.section2.cellViewModel.buttonTapped = { [weak self] in
            self?.dataSource.section2.cellViewModel.labelLabelViewModel.lineCount = 0
            self?.dataSource.section2.cellViewModel.buttonIsHidden = true
        }
        dataSource.section3.cellViewModel.switchedToLeft = { [weak self] isEvolved in
            print(self?.dataSource.section3.cellViewModel.isLeft as Any)
            self?.tableView.updateViewModelWithoutTableUpdate { [weak self] in
                guard let self = self else { return }
                self.dataSource.section3.cellViewModel.isLeft = isEvolved
                self.dataSource.section4.cellsViewModels = isEvolved ? self.card.evolvedViewModels : self.card.unevolvedViewModels
            }
            guard let self = self else { return }
            print(self.dataSource.section3.cellViewModel.isLeft)
            self.tableView.reloadRows(at: self.tableView.indices(inSection: 3), with: .automatic)
        }
    }
}
