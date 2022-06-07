//
//  CardDetailViewController.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/4/22.
//

import UIKit
import TableMVVM

typealias CardDetailDataSource = TableDataSource5<
    SectionOneRow<ViewModelCell<Container<UILabel>>>,
    SectionOneRow<ViewModelCell<Container<CardImageView>>>,
    SectionOneRow<ViewModelCell<Container<CollapsableLabelLabel>>>,
    SectionOneRow<ViewModelCell<Container<TarotSwitchView>>>,
    SectionNoHeader<ViewModelCell<Container<LabelLabel>>>
>

class CardDetailViewController: UIViewController {

    var tableView: UITableMVVM<CardDetailDataSource> = UITableMVVM(viewModel: .init())
    var card: Card! // unit tested.

    static func instantiate(card: Card) -> CardDetailViewController {
        let detailController: CardDetailViewController = UIStoryboard.vc()!
        detailController.tableView.viewModel = CardDetailDataSource(
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
                        topText: "Description",
                        bottomText: card.desc
                    )
                )
            ),
            section3: .init(cellViewModel: .init(insets: .standard, viewModel: TarotSwitchView.ViewModel())),
            section4: .init(cellsViewModels: card.evolvedViewModels.map { .init(insets: .standard, viewModel: $0)})
        )
        detailController.card = card
        return detailController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .clear
        view.set(background: BackgroundView.zero.darkShade)
        view.inject(view: tableView)
        tableView.viewModel?.section2.cellViewModel.viewModel.buttonTapped = { [weak self] in
            self?.tableView.viewModel?.section2.cellViewModel.viewModel.labelLabelViewModel.lineCount = 0
            self?.tableView.viewModel?.section2.cellViewModel.viewModel.buttonIsHidden = true
        }
        tableView.viewModel?.section3.cellViewModel.viewModel.switchedToLeft = { [weak self] isEvolved in
            self?.tableView.updateViewModelWithoutTableUpdate { [weak self] in
                guard let self = self else { return }
                self.tableView.viewModel?.section3.cellViewModel.viewModel.isLeft = isEvolved
                self.tableView.viewModel?.section4.cellsViewModels = (isEvolved ? self.card.evolvedViewModels : self.card.unevolvedViewModels).map { .init(insets: .standard, viewModel: $0)}
            }
            guard let self = self else { return }
            self.tableView.reloadRows(at: self.tableView.indices(inSection: 3), with: .automatic)
        }
    }
}

extension UILabel {
    func with(text: String) -> Self {
        self.text = text
        return self
    }

    func with(lineCount: Int) -> Self {
        self.numberOfLines = lineCount
        return self
    }
}
