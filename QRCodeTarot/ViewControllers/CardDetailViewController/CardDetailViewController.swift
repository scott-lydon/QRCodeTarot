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
typealias EvolveSection = SectionNoHeader<ViewModelCell<LabelLabel>>

typealias CardDetailDataSource = TableDataSource4<
    SectionOneRow<CardImageCell>,
    SectionOneRow<CollapseTextCell>,
    SectionOneRow<TarotSwitchCell>,
    SectionAlternator2<EvolveSection, EvolveSection>
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


    static func instantiate(card: Card) -> CardDetailViewController {
        let detailController: CardDetailViewController = UIStoryboard.vc()!
        detailController.dataSource = .init(
            section0: SectionOneRow(cellViewModel: card.image ?? .init()),
            section1: SectionOneRow(
                cellViewModel: CollapsableLabelLabel.ViewModel(
                    topText: "Description",
                    bottomText: card.desc
                )
            ),
            section2: SectionOneRow(cellViewModel: TarotSwitchView.ViewModel()),
            section3: SectionAlternator2(
                section1: EvolveSection(cellsViewModels: card.evolvedViewModels),
                section2: EvolveSection(cellsViewModels: card.unevolvedViewModels),
                alternatingLogic: nil
            )
        )
        return detailController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .clear
        view.set(background: BackgroundView.zero.darkShade)
        view.inject(view: tableView)
        dataSource.section3.alternatingLogic = { [weak self] section1, section2 in
            return self?.dataSource.section2.cellViewModel.isLeft == true ? section1 : section2
        }
        dataSource.section2.cellViewModel.didSwitchTo = { [weak self] isEvolved in
            self?.tableView.reload()
        }
    }
}
