//
//  CardDetailViewController.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/4/22.
//

import UIKit
import TableMVVM
import CommonUIKitExtensions

typealias CardDetailDataSource = TableDataSource5<
    SectionOneRow<ViewModelCell<Container<UILabel>>>,
    SectionOneRow<ViewModelCell<Container<CardImageView>>>,
    SectionOneRow<ViewModelCell<Container<CollapsableLabelLabel>>>,
    SectionOneRow<ViewModelCell<Container<TarotSwitchView>>>,
    SectionNoHeader<ViewModelCell<Container<LabelLabel>>>
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
                            lineCount: 4
                        ),
                        buttonText: "Read More",
                        buttonIsHidden: UILabel
                            .with(width: UIScreen.main.bounds.width - 48)
                            .with(lineCount: 0)
                            .with(text: card.desc)
                            .actualLineCount < 6
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
        dataSource.section2.cellViewModel.viewModel.buttonTapped = { [weak self] in
            self?.dataSource.section2.cellViewModel.viewModel.labelLabelViewModel.lineCount = 0
            self?.dataSource.section2.cellViewModel.viewModel.buttonIsHidden = true
        }
        dataSource.section3.cellViewModel.viewModel.switchedToLeft = { [weak self] isEvolved in
            self?.tableView.updateViewModelWithoutTableUpdate { [weak self] in
                guard let self = self else { return }
                self.dataSource.section3.cellViewModel.viewModel.isLeft = isEvolved
                self.dataSource.section4.cellsViewModels = (isEvolved ? self.card.evolvedViewModels : self.card.unevolvedViewModels).map { .init(insets: .standard, viewModel: $0)}
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
